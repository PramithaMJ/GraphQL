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
    string addr;
|};

service /graphql on new graphql:Listener(4000) {
    private Person profile;

    function init() {
        self.profile = { name: "Walter White", age: 50, city: "Albuquerque" ,nic:1234567,addr: "City"};
    }

    # Description.
    # + return - return value description
    resource function get profile() returns Person {
        return self.profile;
    }

        # Description.
        #
        # + name - parameter description
        # + return - return value description
        remote function updateName(string name) returns Person {
        self.profile.name = name;
        return self.profile;
    }

    # Description.
    #
    # + city - parameter description
    # + return - return value description
    remote function updateCity(string city) returns Person {
        self.profile.city = city;
        return self.profile;
    }

    # Description.
    #
    # + nic - parameter description
    # + return - return value description
    remote function updateNic(int nic) returns Person {
        self.profile.nic = nic;
        return self.profile;
        
    }
    # Description.
    #
    # + addr - parameter description
    # + return - return value description
    remote function update(string addr) returns Person{
        self.profile.addr = addr;
        return self.profile;
    }
}