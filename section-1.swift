// Playground - noun: a place where people can play

import Foundation
import XCPlayground
import UIKit


func httpGet(url: String, callback: (String, String?) -> Void){

    var request = NSMutableURLRequest(URL: NSURL(string: url)!)
    var session = NSURLSession.sharedSession()
    var task = session.dataTaskWithRequest(request){
        (data, response, error) -> Void in
        if error != nil {
            callback("", error.localizedDescription)
        }else{
            var result = NSString(data: data, encoding: NSASCIIStringEncoding)!
            callback(result, nil)
        }
    }
    task.resume()
}


func callbackGet (a: String, b: String?) -> Void{
    println(a)
}


httpGet("http://localhost/tfg_server/1/eventos", callbackGet)

/*
    Descomentar esta línea en el PlayGround
*/
//XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

