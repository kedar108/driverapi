import Vapor

let drop = Droplet()

var strct = JSON([])

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("hello"){ req in
    
    return  "hello world"
    
}


drop.get("version"){ req in
    
    return  try JSON(node: [
        "version": "1.0"
        ])
    
}

drop.post("passjson"){ req in
    
    print(req)
    
    guard req.json != nil else
    {
        return "json not found"
    }
    strct = req.json!
    
    
    print(strct)
    
    return try strct
    
}


drop.resource("posts", PostController())

drop.run()
