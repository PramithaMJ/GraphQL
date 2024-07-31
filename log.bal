import ballerina/log;
import ballerina/random;

public function main() {
    float duration = getDutration();
    log:printDebug("Checking the duration", duration = duration);
}

function getDutration() returns float {
    log:printInfo("Calculating duration");
    return random:createDecimal() * 100.0;
}
