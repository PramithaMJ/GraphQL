// Imports the default module from the `ballerina/log` package.
import ballerina/log;
// Imports the default module from the `salesforce` package
// with an import prefix.
import ballerinax/salesforce as sf;
// Imports a non-default module from the `salesforce` package
// with an import prefix.
import ballerinax/salesforce.bulk as sfBulk;

configurable string baseUrl = ?;
configurable string token = ?;

sf:ConnectionConfig sfConfig = {baseUrl, auth: {token}};

public function main() returns error? {
    string contacts = "Name,Email\n"
        + "John,john434@gmail.com\n"
        + "Peter,peter77@gmail.com";

    sfBulk:Client bulkClient = check new (sfConfig);
    sfBulk:BulkJob insertJob = check bulkClient->createJob("insert", "Contact", "CSV");
    sfBulk:BatchInfo batch = check bulkClient->addBatch(insertJob, contacts);

    log:printInfo(batch.id.length() > 0 ? "Batch Added Successfully" : "Failed to add the Batch");
}