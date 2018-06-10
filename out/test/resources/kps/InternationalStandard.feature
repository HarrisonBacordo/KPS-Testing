Feature: International standard shipping

  Background:
    Given an initial custom map at directory "src/test/resources/kps/logs/international.xml"

  Scenario Outline: Outline for international standard shipping
    Given a parcel that weighs <weight>kg
    Given a parcel that measures <measurements> cc
    And I send the parcel from "<from_city>" "<from_country>"
    And I send the parcel to "<to_city>" "<to_country>"
    And I send the parcel by "<priority>" mail
    Then the cost is $<price>
    And the route type is "<route>"
    Examples:
      | weight | measurements | from_city        | from_country | to_city        | to_country    | priority               | price | route |
      | 1      | 1000         | Auckland         | New Zealand  | Singapore City | Singapore     | international standard | 20    | Sea   |
      | 1      | 1000         | Auckland         | New Zealand  | Place          | Martin Island | international standard | 20    | Sea   |
      | 1      | 1000         | Auckland         | New Zealand  | Sydney         | Australia     | international standard | 20    | Sea   |
      | 1      | 1000         | Auckland         | New Zealand  | Montreal       | Canada        | international standard | 20    | Sea   |
      | 1      | 1000         | Hamilton         | New Zealand  | Singapore City | Singapore     | international standard | 25    | Sea   |
      | 1      | 1000         | Hamilton         | New Zealand  | Place          | Martin Island | international standard | 25    | Sea   |
      | 1      | 1000         | Hamilton         | New Zealand  | Sydney         | Australia     | international standard | 25    | Sea   |
      | 1      | 1000         | Hamilton         | New Zealand  | Montreal       | Canada        | international standard | 25    | Sea   |
      | 1      | 1000         | Rotorua          | New Zealand  | Singapore City | Singapore     | international standard | 25    | Sea   |
      | 1      | 1000         | Rotorua          | New Zealand  | Place          | Martin Island | international standard | 25    | Sea   |
      | 1      | 1000         | Rotorua          | New Zealand  | Sydney         | Australia     | international standard | 25    | Sea   |
      | 1      | 1000         | Rotorua          | New Zealand  | Montreal       | Canada        | international standard | 25    | Sea   |
      | 1      | 1000         | Palmerston North | New Zealand  | Singapore City | Singapore     | international standard | 25    | Sea   |
      | 1      | 1000         | Palmerston North | New Zealand  | Place          | Martin Island | international standard | 25    | Sea   |
      | 1      | 1000         | Palmerston North | New Zealand  | Sydney         | Australia     | international standard | 25    | Sea   |
      | 1      | 1000         | Palmerston North | New Zealand  | Montreal       | Canada        | international standard | 25    | Sea   |
      | 1      | 1000         | Wellington       | New Zealand  | Singapore City | Singapore     | international standard | 25    | Sea   |
      | 1      | 1000         | Wellington       | New Zealand  | Place          | Martin Island | international standard | 25    | Sea   |
      | 1      | 1000         | Wellington       | New Zealand  | Sydney         | Australia     | international standard | 25    | Sea   |
      | 1      | 1000         | Wellington       | New Zealand  | Montreal       | Canada        | international standard | 25    | Sea   |
      | 1      | 1000         | Christchurch     | New Zealand  | Singapore City | Singapore     | international standard | 25    | Sea   |
      | 1      | 1000         | Christchurch     | New Zealand  | Place          | Martin Island | international standard | 25    | Sea   |
      | 1      | 1000         | Christchurch     | New Zealand  | Sydney         | Australia     | international standard | 25    | Sea   |
      | 1      | 1000         | Christchurch     | New Zealand  | Montreal       | Canada        | international standard | 25    | Sea   |
      | 1      | 1000         | Dunedin          | New Zealand  | Singapore City | Singapore     | international standard | 25    | Sea   |
      | 1      | 1000         | Dunedin          | New Zealand  | Place          | Martin Island | international standard | 25    | Sea   |
      | 1      | 1000         | Dunedin          | New Zealand  | Sydney         | Australia     | international standard | 25    | Sea   |
      | 1      | 1000         | Dunedin          | New Zealand  | Montreal       | Canada        | international standard | 25    | Sea   |

  Scenario Outline: Doesn't accept mail to nonexistent destinations
    Given a parcel that weighs <weight>kg
    Given a parcel that measures <measurements> cc
    And I send the parcel from "<from_city>" "<from_country>"
    And I send the parcel to "<to_city>" "<to_country>"
    And I send the parcel by "<priority>" mail
    Then the mail should not be accepted
    Examples:
      | weight | measurements | from_city        | from_country | to_city     | to_country  | priority               |
      | 1      | 1000         | Auckland         | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Auckland         | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Auckland         | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Auckland         | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Hamilton         | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Hamilton         | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Hamilton         | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Hamilton         | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Rotorua          | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Rotorua          | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Rotorua          | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Rotorua          | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Palmerston North | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Palmerston North | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Palmerston North | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Palmerston North | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Wellington       | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Wellington       | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Wellington       | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Wellington       | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Christchurch     | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Christchurch     | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Christchurch     | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Christchurch     | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Dunedin          | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Dunedin          | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Dunedin          | New Zealand  | Nonexistent | Nonexistent | international standard |
      | 1      | 1000         | Dunedin          | New Zealand  | Nonexistent | Nonexistent | international standard |

  Scenario Outline: Doesn't accept mail from nonexistent destinations
    Given a parcel that weighs <weight>kg
    Given a parcel that measures <measurements> cc
    And I send the parcel from "<from_city>" "<from_country>"
    And I send the parcel to "<to_city>" "<to_country>"
    And I send the parcel by "<priority>" mail
    Then the mail should not be accepted
    Examples:
      | weight | measurements | from_city   | from_country | to_city        | to_country    | priority               |
      | 1      | 1000         | Nonexistent | Nonexistent  | Singapore City | Singapore     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Place          | Martin Island | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Sydney         | Australia     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Montreal       | Canada        | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Singapore City | Singapore     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Place          | Martin Island | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Sydney         | Australia     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Montreal       | Canada        | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Singapore City | Singapore     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Place          | Martin Island | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Sydney         | Australia     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Montreal       | Canada        | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Singapore City | Singapore     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Place          | Martin Island | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Sydney         | Australia     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Montreal       | Canada        | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Singapore City | Singapore     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Place          | Martin Island | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Sydney         | Australia     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Montreal       | Canada        | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Singapore City | Singapore     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Place          | Martin Island | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Sydney         | Australia     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Montreal       | Canada        | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Singapore City | Singapore     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Place          | Martin Island | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Sydney         | Australia     | international standard |
      | 1      | 1000         | Nonexistent | Nonexistent  | Montreal       | Canada        | international standard |

  Scenario Outline: Incoming international mail does not cost either the KPS or the customer anything
    Given a parcel that weighs <weight>kg
    Given a parcel that measures <measurements> cc
    And I send the parcel from "<from_city>" "<from_country>"
    And I send the parcel to "<to_city>" "<to_country>"
    And I send the parcel by "<priority>" mail
    Then the cost is $<price>
    Examples:
      | weight | measurements | from_city      | from_country  | to_city          | to_country  | priority               | price |
      | 1      | 1000         | Singapore City | Singapore     | Auckland         | New Zealand | international standard | 0     |
      | 1      | 1000         | Singapore City | Singapore     | Hamilton         | New Zealand | international standard | 0     |
      | 1      | 1000         | Singapore City | Singapore     | Rotorua          | New Zealand | international standard | 0     |
      | 1      | 1000         | Singapore City | Singapore     | Palmerston North | New Zealand | international standard | 0     |
      | 1      | 1000         | Singapore City | Singapore     | Wellington       | New Zealand | international standard | 0     |
      | 1      | 1000         | Singapore City | Singapore     | Christchurch     | New Zealand | international standard | 0     |
      | 1      | 1000         | Singapore City | Singapore     | Dunedin          | New Zealand | international standard | 0     |
      | 1      | 1000         | Place          | Martin Island | Auckland         | New Zealand | international standard | 0     |
      | 1      | 1000         | Place          | Martin Island | Hamilton         | New Zealand | international standard | 0     |
      | 1      | 1000         | Place          | Martin Island | Rotorua          | New Zealand | international standard | 0     |
      | 1      | 1000         | Place          | Martin Island | Palmerston North | New Zealand | international standard | 0     |
      | 1      | 1000         | Place          | Martin Island | Wellington       | New Zealand | international standard | 0     |
      | 1      | 1000         | Place          | Martin Island | Christchurch     | New Zealand | international standard | 0     |
      | 1      | 1000         | Place          | Martin Island | Dunedin          | New Zealand | international standard | 0     |
      | 1      | 1000         | Sydney         | Australia     | Auckland         | New Zealand | international standard | 0     |
      | 1      | 1000         | Sydney         | Australia     | Hamilton         | New Zealand | international standard | 0     |
      | 1      | 1000         | Sydney         | Australia     | Rotorua          | New Zealand | international standard | 0     |
      | 1      | 1000         | Sydney         | Australia     | Palmerston North | New Zealand | international standard | 0     |
      | 1      | 1000         | Sydney         | Australia     | Wellington       | New Zealand | international standard | 0     |
      | 1      | 1000         | Sydney         | Australia     | Christchurch     | New Zealand | international standard | 0     |
      | 1      | 1000         | Sydney         | Australia     | Dunedin          | New Zealand | international standard | 0     |
      | 1      | 1000         | Sydney         | Australia     | Auckland         | New Zealand | international standard | 0     |
      | 1      | 1000         | Montreal       | Canada        | Hamilton         | New Zealand | international standard | 0     |
      | 1      | 1000         | Montreal       | Canada        | Rotorua          | New Zealand | international standard | 0     |
      | 1      | 1000         | Montreal       | Canada        | Palmerston North | New Zealand | international standard | 0     |
      | 1      | 1000         | Montreal       | Canada        | Wellington       | New Zealand | international standard | 0     |
      | 1      | 1000         | Montreal       | Canada        | Christchurch     | New Zealand | international standard | 0     |
      | 1      | 1000         | Montreal       | Canada        | Dunedin          | New Zealand | international standard | 0     |

  Scenario Outline: Doesn't accept mail from unreachable locations
    Given a parcel that weighs <weight>kg
    Given a parcel that measures <measurements> cc
    And I send the parcel from "<from_city>" "<from_country>"
    And I send the parcel to "<to_city>" "<to_country>"
    And I send the parcel by "<priority>" mail
    Then the mail should not be accepted
    Examples:
      | weight | measurements | from_city | from_country | to_city | to_country | priority               |
      | 1      | 1000         | Auckland  | New Zealand  | Okinawa | Japan      | international standard |