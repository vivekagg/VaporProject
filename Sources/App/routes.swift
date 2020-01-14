import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    
    router.get("hello", "vapor") { req -> String in
        return "Hello Vapor!"
    }

    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    router.get{ req -> Future<View> in
        return Customer.query(on: req).all().flatMap(to: View.self){
            customers in
            print(customers)
            //let cus1 = Customer(id: 232, name: "23", age: 2, password: "23")
            //let cus2 = Customer(id: 2323, name: "233", age: 32, password: "233")
            //print([cus1,cus2])
            return try req.view().render("home",["customer":customers])
        }
    }
    router.post(Customer.self,at: "add"){
        req,customer -> Future<Response> in
        return customer.save(on: req).map(to: Response.self){ customer in
        return  req.redirect(to: "/")
        }
    }
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)

}
