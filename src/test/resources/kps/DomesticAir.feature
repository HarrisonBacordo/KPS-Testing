Feature: Domestic air shipping

  Background:
    Given an initial map

  Scenario Outline: Outline for domestic air shipping
    Given a parcel that weighs <weight>kg
    Given a parcel that measures <measurements> cc
    And I send the parcel from "<from_city>" "<from_country>"
    And I send the parcel to "<to_city>" "<to_country>"
    And I send the parcel by "<priority>" mail
    Then the cost is $<price>
    Examples:
      | weight | measurements | from_city        | from_country | to_city          | to_country  | priority     | price |
      | 1      | 1000         | Auckland         | New Zealand  | Auckland         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Auckland         | New Zealand  | Hamilton         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Auckland         | New Zealand  | Rotorua          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Auckland         | New Zealand  | Palmerston North | New Zealand | domestic air | 5     |
      | 1      | 1000         | Auckland         | New Zealand  | Wellington       | New Zealand | domestic air | 5     |
      | 1      | 1000         | Auckland         | New Zealand  | Christchurch     | New Zealand | domestic air | 5     |
      | 1      | 1000         | Auckland         | New Zealand  | Dunedin          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Hamilton         | New Zealand  | Auckland         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Hamilton         | New Zealand  | Hamilton         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Hamilton         | New Zealand  | Rotorua          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Hamilton         | New Zealand  | Palmerston North | New Zealand | domestic air | 5     |
      | 1      | 1000         | Hamilton         | New Zealand  | Wellington       | New Zealand | domestic air | 5     |
      | 1      | 1000         | Hamilton         | New Zealand  | Christchurch     | New Zealand | domestic air | 5     |
      | 1      | 1000         | Hamilton         | New Zealand  | Dunedin          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Rotorua          | New Zealand  | Auckland         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Rotorua          | New Zealand  | Hamilton         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Rotorua          | New Zealand  | Rotorua          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Rotorua          | New Zealand  | Palmerston North | New Zealand | domestic air | 5     |
      | 1      | 1000         | Rotorua          | New Zealand  | Wellington       | New Zealand | domestic air | 5     |
      | 1      | 1000         | Rotorua          | New Zealand  | Christchurch     | New Zealand | domestic air | 5     |
      | 1      | 1000         | Rotorua          | New Zealand  | Dunedin          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Palmerston North | New Zealand  | Auckland         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Palmerston North | New Zealand  | Hamilton         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Palmerston North | New Zealand  | Rotorua          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Palmerston North | New Zealand  | Palmerston North | New Zealand | domestic air | 5     |
      | 1      | 1000         | Palmerston North | New Zealand  | Wellington       | New Zealand | domestic air | 5     |
      | 1      | 1000         | Palmerston North | New Zealand  | Christchurch     | New Zealand | domestic air | 5     |
      | 1      | 1000         | Palmerston North | New Zealand  | Dunedin          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Wellington       | New Zealand  | Auckland         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Wellington       | New Zealand  | Hamilton         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Wellington       | New Zealand  | Rotorua          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Wellington       | New Zealand  | Palmerston North | New Zealand | domestic air | 5     |
      | 1      | 1000         | Wellington       | New Zealand  | Wellington       | New Zealand | domestic air | 5     |
      | 1      | 1000         | Wellington       | New Zealand  | Christchurch     | New Zealand | domestic air | 5     |
      | 1      | 1000         | Wellington       | New Zealand  | Dunedin          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Christchurch     | New Zealand  | Auckland         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Christchurch     | New Zealand  | Hamilton         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Christchurch     | New Zealand  | Rotorua          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Christchurch     | New Zealand  | Palmerston North | New Zealand | domestic air | 5     |
      | 1      | 1000         | Christchurch     | New Zealand  | Wellington       | New Zealand | domestic air | 5     |
      | 1      | 1000         | Christchurch     | New Zealand  | Christchurch     | New Zealand | domestic air | 5     |
      | 1      | 1000         | Christchurch     | New Zealand  | Dunedin          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Dunedin          | New Zealand  | Auckland         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Dunedin          | New Zealand  | Hamilton         | New Zealand | domestic air | 5     |
      | 1      | 1000         | Dunedin          | New Zealand  | Rotorua          | New Zealand | domestic air | 5     |
      | 1      | 1000         | Dunedin          | New Zealand  | Palmerston North | New Zealand | domestic air | 5     |
      | 1      | 1000         | Dunedin          | New Zealand  | Wellington       | New Zealand | domestic air | 5     |
      | 1      | 1000         | Dunedin          | New Zealand  | Christchurch     | New Zealand | domestic air | 5     |
      | 1      | 1000         | Dunedin          | New Zealand  | Dunedin          | New Zealand | domestic air | 5     |