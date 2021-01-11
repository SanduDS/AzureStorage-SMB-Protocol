//import ballerina/io;
//import ballerina/system;
//import ballerina/log;
//import ballerina/lang.'string as str;
//
//public function main() {
//    system:Process x= <system:Process>system:exec("./test.sh");
//    io:ReadableByteChannel input =<io:ReadableByteChannel> x.stdout();
//
//    //var strResult = input.readString(0, "UTF-8");
//    byte[]|io:Error result = input.readAll();
//    if (result is byte[]) {
//        io:println(str:fromBytes(result).toString());
//    } else {
//        log:printError("Error occurred while reading name");
//    }
//    var xx=testCopy();
//
//
//}
//
//function testCopy () returns @tainted error?{
//    string imagePath = "/mnt/filesharetestwso2/test2/test.jpg";
//    string imageCopyPath1 = "resources/test.jpg";
//    //string imageCopyPath2 = "./files/ballerinaCopy1.jpg";
//
//    byte[] bytes = check io:fileReadBytes(imagePath);
//
//    check io:fileWriteBytes(imageCopyPath1, bytes);
//    io:println("Successfully copied the image as a byte array.");
//
//    //stream<io:Block> blockStream = check
//    //io:fileReadBlocksAsStream(imagePath, 2048);
//
//   // check io:fileWriteBlocksFromStream(imageCopyPath2, blockStream);
//    //io:println("Successfully copied the image as a stream.");
//}
//