package kps;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import kps.server.*;
import kps.server.logs.CustomerCostUpdate;
import kps.server.logs.MailDelivery;
import kps.server.logs.TransportCostUpdate;
import kps.server.logs.TransportDiscontinue;
import kps.util.MailPriority;
import kps.util.RouteNotFoundException;
import kps.util.RouteType;
import org.junit.Assert;

import java.time.DayOfWeek;


public class MailSteps {

    private BusinessFigures figures = new BusinessFigures();
    private KPSServer server = new KPSServer("NUL", figures);
    private int weight;
    private int measure;
    private Destination fromDest;
    private Destination toDest;
    private String fromCity;
    private String fromCountry;
    private String toCity;
    private String toCountry;
    private String priority;
    private String firm;
    private RouteType routeType;
    private TransportDiscontinue discontinuedRoute;
    private TransportCostUpdate transportCostUpdate;
    private CustomerCostUpdate customerCostUpdate;

    @Given("^an initial map$")
    public void anInitialMap() throws Throwable {
        server.readInitialLog("data/data.xml");
    }

    @Given("^an initial custom map at directory \"([^\"]*)\"$")
    public void anInitialCustomMap(String filePath) throws Throwable {
        server.readInitialLog(filePath);
    }


    @Given("^a parcel that weighs ([^\"]*)kg$")
    public void aParcelThatWeighsKg(int weight) {
        this.weight = weight;
    }

    @Given("^a parcel that measures ([^\"]*) cc$")
    public void aParcelThatMeasuresCc(int measure) {
        this.measure = measure / 1000;
    }

    @Given("^I send the parcel from \"([^\"]*)\" \"([^\"]*)\"$")
    public void iSendTheParcelFrom(String fromCity, String fromCountry) {
        fromDest = new Destination(fromCity, fromCountry);
        this.fromCity = fromCity;
        this.fromCountry = fromCountry;
    }

    @Given("^I send the parcel to \"([^\"]*)\" \"([^\"]*)\"$")
    public void iSendTheParcelTo(String toCity, String toCountry) {
        this.toDest = new Destination(toCity, toCountry);
        this.toCity = toCity;
        this.toCountry = toCountry;
    }

    @Given("^I send the parcel through the firm \"([^\"]*)\"$")
    public void isThroughFirm(String firm) {
        this.firm = firm;
    }

    @Given("^I send the using the route type \"([^\"]*)\"$")
    public void usingRouteType(String routeType) {
        switch (routeType) {
            case "Land":
                this.routeType = RouteType.LAND;
                break;
            case "Sea":
                this.routeType = RouteType.SEA;
                break;
            case "Air":
                this.routeType = RouteType.AIR;
                break;
        }
    }

    @Given("^I send the parcel by \"([^\"]*)\" mail$")
    public void iSendTheParcelByDomesticStandardMail(String priority) {
        this.priority = priority;
    }

    @Given("^there's no other transport option but \"([^\"]*)\"$")
    public void isOnlyTransportOption(String onlyTransportOption) {
    }

    @Given("^there is a customer price update$")
    public void customerPriceUpdated() {
        Destination to = new Destination(toCity, toCountry);
        Destination from = new Destination(fromCity, fromCountry);
        customerCostUpdate = new CustomerCostUpdate(to, from, MailPriority.fromString(priority), 5, 5);
    }

    @Given("^and the route has been discontinued$")
    public void routeDiscontinued() {
        discontinuedRoute = new TransportDiscontinue(toDest, fromDest, firm, routeType);
    }

    @Given("^there is a transport cost update$")
    public void transportCostUpdated() {
        transportCostUpdate = new TransportCostUpdate(toDest, fromDest, firm, routeType, 100,
                100, DayOfWeek.MONDAY, 1, 1, 200, 200);
    }


    @Then("^the cost is \\$([^\"]*)$")
    public void theCostIs$(int expectedCost) throws Throwable {
        Mail mail = new Mail(toDest, fromDest, MailPriority.fromString(priority), weight, measure);
        TransportRoute route = server.getTransportMap().calculateRoute(mail).get(0);
        System.out.println(route.calculateCost(mail.weight, mail.volume));
        Assert.assertTrue(expectedCost == route.calculateCost(mail.weight, mail.volume));
    }

    @Then("^the route type is \"([^\"]*)\"$")
    public void theRouteTypeIs(String expectedRouteType) throws Throwable {
        RouteType expected = null;
        switch(expectedRouteType) {
            case "Air":
                expected = RouteType.AIR;
                break;
            case "Land":
                expected = RouteType.LAND;
                break;
            case "Sea":
                expected = RouteType.SEA;
                break;
        }
        Mail mail = new Mail(toDest, fromDest, MailPriority.fromString(priority), weight, measure);
        TransportRoute route = server.getTransportMap().calculateRoute(mail).get(0);
        System.out.println(route.type.name());
        Assert.assertEquals(route.getType(), expected);
    }

    @Then("^the mail should not be accepted$")
    public void mailShouldFail() {
        Mail mail = new Mail(toDest, fromDest, MailPriority.fromString(priority), weight, measure);
        try {
            server.getTransportMap().calculateRoute(mail);
            Assert.fail("Exception not thrown");
        } catch (RouteNotFoundException | NullPointerException e) {
            assert true;
        }
    }

    @Then("^the business figures should change$")
    public void businessFiguresChanged() {
        figures = this.server.getBusinessFigures();
        assert checkBusinessFigures(figures, true);
        MailDelivery mail = new MailDelivery(toDest, fromDest, weight, measure, MailPriority.fromString(priority), DayOfWeek.MONDAY);
        CustomerRoute route = this.server.getTransportMap().getCustomerRoute(mail);
        figures.sendMail(20, 10, weight, measure, 1, route);
        figures = this.server.getBusinessFigures();
        assert checkBusinessFigures(figures, false);
    }

    @Then("^the route should no longer exist in the system$")
    public void doesRouteNotExist() {
//        TODO need to fix this up
        Assert.assertTrue(server.getTransportMap().getCustomerRoutes().contains(discontinuedRoute));
        Assert.assertTrue(server.getTransportMap().getTransportRoutes().contains(discontinuedRoute));
        this.server.getTransportMap().apply(discontinuedRoute);
        Assert.assertTrue(!server.getTransportMap().getCustomerRoutes().contains(discontinuedRoute));
        Assert.assertTrue(!server.getTransportMap().getTransportRoutes().contains(discontinuedRoute));
    }

    @Then("^the amount a customer is charged should be changed$")
    public void hasCustomerPriceChanged() {
        MailDelivery mail = new MailDelivery(toDest, fromDest, weight, measure, MailPriority.fromString(priority), DayOfWeek.MONDAY);
        Double oldPrice = server.getTransportMap().getCustomerPrice(mail);
        this.server.getTransportMap().apply(customerCostUpdate);
        Assert.assertTrue(server.getTransportMap().getCustomerPrice(mail) != oldPrice);
    }

    @Then("^the amount KPS must pay should change$")
    public void hasKpsCostChanged() throws Throwable {
        MailDelivery mail = new MailDelivery(toDest, fromDest, weight, measure, MailPriority.fromString(priority), DayOfWeek.MONDAY);
        Double oldPrice = server.getTransportMap().getTransportPrice(mail);
        this.server.getTransportMap().apply(transportCostUpdate);
        Assert.assertTrue(server.getTransportMap().getTransportPrice(mail) != oldPrice);
    }

    private boolean checkBusinessFigures(BusinessFigures businessFigures, boolean isInit) {
        if (isInit) {
            assert (businessFigures.getRevenue() == 0);
            assert (businessFigures.getExpenditure() == 0);
            assert (businessFigures.getMailCount() == 0);
            assert (businessFigures.getTotalVolume() == 0);
            assert (businessFigures.getTotalWeight() == 0);
            assert (businessFigures.getAverageDeliveryDays() == 0);
            assert (businessFigures.getCriticalRoutes().isEmpty());
        } else {
            assert (businessFigures.getRevenue() != 0);
            assert (businessFigures.getExpenditure() != 0);
            assert (businessFigures.getMailCount() != 0);
            assert (businessFigures.getTotalVolume() != 0);
            assert (businessFigures.getTotalWeight() != 0);
            assert (businessFigures.getAverageDeliveryDays() != 0);
            assert (!businessFigures.getCriticalRoutes().isEmpty());
        }
        return true;
    }

}
