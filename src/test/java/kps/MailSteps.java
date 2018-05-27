package kps;
import cucumber.api.java.en.*;
import cucumber.api.PendingException;

import org.junit.Assert;

import kps.server.BusinessFigures;
import kps.server.Destination;
import kps.server.KPSServer;
import kps.server.Mail;
import kps.server.TransportRoute;
import kps.server.UserRecord;
import kps.server.UserRecord.Role;
import kps.server.logs.LogItem;
import kps.server.logs.MailDelivery;
import kps.util.MailPriority;
import kps.util.RouteNotFoundException;
import kps.util.XMLFormatException;


public class MailSteps {

BusinessFigures figures = new BusinessFigures();
KPSServer server = new KPSServer("NUL", figures);
int weight;
int measure;
String fromCity;
String fromCountry;
String toCity;
String toCountry;
String priority;
double cost;		

@Given("^an initial map$")
public void anInitialMap() throws Throwable {
    server.readInitialLog("data/data.xml");   
}

@Given("^a parcel that weighs ([^\"]*)kg$")
public void aParcelThatWeighsKg(int weight) throws Throwable {
    this.weight = weight;
}

@Given("^a parcel that measures ([^\"]*) cc$")
public void aParcelThatMeasuresCc(int measure) throws Throwable {
    this.measure = measure / 1000;
}

@Given("^I send the parcel from \"([^\"]*)\" \"([^\"]*)\"$")
public void iSendTheParcelFrom(String fromCity, String fromCountry) throws Throwable {
    this.fromCity = fromCity;
    this.fromCountry = fromCountry;
}

@Given("^I send the parcel to \"([^\"]*)\" \"([^\"]*)\"$")
public void iSendTheParcelTo(String toCity, String toCountry) throws Throwable {
    this.toCity = toCity;
    this.toCountry = toCountry;
}

@Given("^I send the parcel by \"([^\"]*)\" mail$")
public void iSendTheParcelByDomesticStandardMail(String priority) throws Throwable {
    this.priority = priority;
}

@Then("^the cost is \\$([^\"]*)$")
public void theCostIs$(int expectedCost) throws Throwable {
Destination to = new Destination(toCity, toCountry);
Destination from = new Destination(fromCity, fromCountry);
Mail mail = new Mail(to, from, MailPriority.fromString(priority), weight, measure);
TransportRoute route = server.getTransportMap().calculateRoute(mail).get(0);
Assert.assertTrue(expectedCost == route.calculateCost(mail.weight, mail.volume));
}



}
