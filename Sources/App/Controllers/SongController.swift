//
//  SongController.swift
//  
//
//  Created by Duy Khang Nguyen Truong on 5/31/23.
//

import Vapor
import Fluent

struct SongController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let songs = routes.grouped("songs")
        songs.get(use: index)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Song]> {
        return Song.query(on: req.db).all()
    }
}
