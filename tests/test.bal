import ballerina/test;
import ballerina/io;
SmbClient azureClient = new;

@test:Config {enable: true}
function testReadName() {
    var result = azureClient->getMountedShareName();
    if (result is string) {
        io:println(result.toString());
    } else {
        test:assertFail(msg = result.toString());
    }
}


@test:Config {enable: true}
function TestgetfileFromShare() {
    var result = azureClient->getfileFromShare();
    if (result is string) {
        io:println("Copying From share :"+" "+result);
    } else {
        test:assertFail(msg = result.toString());
    }
}

@test:Config {enable: true}
function testUnMount() {
    var result = azureClient->unMount();
    if (result is string) {

        io:println("unMounted"+" "+result);
    } else {
        test:assertFail(msg = result.toString());
    }
}