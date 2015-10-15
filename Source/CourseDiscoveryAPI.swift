//
//  CourseDiscoveryAPI.swift
//  edX
//
//  Created by Anna Callahan on 10/14/15.
//  Copyright © 2015 edX. All rights reserved.
//



public struct CourseDiscoveryAPI {
    
    static func coursesDeserializer(response : NSHTTPURLResponse, json : JSON) -> Result<[OEXCourse]> {
        return (json.array?.map { (item:JSON) in
                OEXCourse(dictionary: item.dictionaryObject!)
        }).toResult()
    }
    
    public static func getDiscoverableCourses(userID: String? = nil) -> NetworkRequest<[OEXCourse]> {
        let path = (userID != nil ? "api/courses/v1/courses/\(userID)" : "api/courses/v1/courses")
        return NetworkRequest<[OEXCourse]>(
            method: HTTPMethod.GET,
            path : path,
            requiresAuth : true,
            deserializer: .JSONResponse(coursesDeserializer)
        )
    }
}