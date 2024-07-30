import ballerina/graphql;

# Description.
#
# + name - field description  
# + age - field description  
# + city - field description  
# + nic - field description
public type Person record {|
    string name;
    int age;
    string city;
    int nic;
|};

service /graphql on new graphql:Listener(4000) {
    private Person profile;

    function init() {
        self.profile = { name: "Walter White", age: 50, city: "Albuquerque" ,nic:1234567};
    }

    resource function get profile() returns Person {
        return self.profile;
    }

    remote function updateName(string name) returns Person {
        self.profile.name = name;
        return self.profile;
    }

    remote function updateCity(string city) returns Person {
        self.profile.city = city;
        return self.profile;
    }

    remote function updateNic(int nic) returns Person {
        self.profile.nic = nic;
        return self.profile;
        
    }
}