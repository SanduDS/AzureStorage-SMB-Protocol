import ballerina/io;
import ballerina/system;
import ballerina/log;
import ballerina/lang.'string as str;
public client class SmbClient {
    //string sharePath;
    //string shareName;
    
    public function init() {
        system:Process x= <system:Process>system:exec("./test.sh");
        io:ReadableByteChannel input =<io:ReadableByteChannel> x.stdout();
        //var strResult = input.readString(0, "UTF-8");
        byte[]|io:Error result = input.readAll();
        if (result is byte[]) {
            io:println(str:fromBytes(result).toString());
        } else {
            log:printError("Error occurred while reading name");
        }
    }

    remote function getMountedShareName() returns @tainted string|error{
        system:Process|error x= system:exec("./getShareName.sh");
        if(x is system:Process){
            io:ReadableByteChannel input =<io:ReadableByteChannel> x.stdout();
            byte[]|io:Error result = input.readAll();
            if (result is byte[]) {
            //io:println(str:fromBytes(result).toString());
            return str:fromBytes(result).toString();
            } else {
            log:printError("Error occurred while reading");
            return result;
            }
        }else{
            log:printError("error in sh");
            return x;
        }

    }
    remote function unMount() returns @tainted string|error{
       system:Process|error x= system:exec("./unmount.sh");
        if(x is system:Process){
            io:ReadableByteChannel input =<io:ReadableByteChannel> x.stdout();
            byte[]|io:Error result = input.readAll();
            if (result is byte[]) {
            io:println(str:fromBytes(result).toString());
            return str:fromBytes(result).toString();
            } else {
            log:printError("Error occurred while reading");
            return result;
            }
        }else{
            log:printError("error in sh");
            return x;
        } 

    }

    remote function getfileFromShare() returns @tainted string|error {
        string imagePath = "/mnt/filesharetestwso2/test2/profile1.jpg";
        string imageCopyPath1 = "resources/test.jpg";


        byte[] bytes = check io:fileReadBytes(imagePath);

        check io:fileWriteBytes(imageCopyPath1, bytes);
        io:println("Successfully copied the image as a byte array.");
        return "success";
    }

}