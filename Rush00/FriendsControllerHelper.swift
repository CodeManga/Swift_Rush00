//
//  FriendsControllerHelper.swift
//  Rush00
//
//  Created by Hilton MTHIMUNYE on 2018/10/07.
//  Copyright © 2018 Hilton MTHIMUNYE. All rights reserved.
//

import UIKit


class User: NSObject {
    var name: String?
    var profileImageName: UIImage?
    var userId : String?
}

class Friend: NSObject {
    
    var name: String?
    var profileImageName: String?
    
}

class Conversation {
    var user : User?
    var massages : [Massage]?
}


class Massage: NSObject {
    
    var text: String?
    var date: NSDate?
    
    var sender: User?
    
    var friend: Friend?
    
}

var cellSize = CGSize()

extension ViewController {
    func setupData() {
        
        let joe = Friend()
        joe.name = "Joe"
        joe.profileImageName = "icon"
        
        let massage = Massage()
        massage.friend = joe
        massage.text = "Hello, my name is Joe, nice to meet you..."
        massage.date = NSDate()
        
        let ben = Friend()
        ben.name = "Ben"
        ben.profileImageName = "icon"
        
        let massageBen = Massage()
        massageBen.friend = ben
        massageBen.text = "We are only taking the case to the..."
        
        let massageSam = Massage()
        massageSam.friend = ben
        massageSam.text = "We are only taking the case to the..."
        massageSam.date = NSDate()
        
        massageSam.date = NSDate()
        
        massages = [massage, massageBen, massageSam]
        
        
        
        
        var user1 = User()
        user1.profileImageName = #imageLiteral(resourceName: "icon")
        user1.userId = "42353ohnkjsandd"
        
        var user2 = User()
        user2.name = "Donald Trump"
        user2.profileImageName = #imageLiteral(resourceName: "icon")
        user2.userId = "42ljljasdft7tuyd"
        
        var user3 = User()
        user3.name = "Bill Jeff"
        user3.profileImageName = #imageLiteral(resourceName: "icon")
        user3.userId = "sdfhcvfds43547vh567"
        
        var user4 = User()
        user4.name = "Ian Obama"
        user4.profileImageName = #imageLiteral(resourceName: "icon")
        user4.userId = "4235445asddfg5sdsd"
        
        var user5 = User()
        user5.name = "Ben"
        user5.profileImageName = #imageLiteral(resourceName: "icon")
        user5.userId = "4235uakshd34543sfg5sdsd"
        
        var me = User()
        me.name = "Hilton"
        me.profileImageName = #imageLiteral(resourceName: "icon")
        me.userId = "4235434-345435sfgsdsd"
        
//        users = [user1, user2, user3, user4, user5, me]
        
        
        var massage11 = Massage()
//        massage11.date = "03:22 PM"
        massage11.text = "Hi there, how are you! I love your tutorials!"
        massage11.sender = user1
        
        
        var massage21 = Massage()
//        massage21.date = "03:22 PM"
        massage21.text = "Thank you :)"
        massage21.sender = me
        
        var massage31 = Massage()
//        massage31.date = "03:22 PM"
        massage31.text = ":) I can't wait to create this messenger Application and show all my friends!"
        massage31.sender = user1
        
        var massage12 = Massage()
//        massage12.date = NSDate("03:22 PM")
        massage12.text = "I AM THE PRESIDENT! OBEY ME"
        massage12.sender = user2
        
        var massage22 = Massage()
//        massage22.date = "03:22 PM"
        massage22.text = "Thank you :)"
        massage22.sender = me
        
        var massage32 = Massage()
//        massage32.date = "03:22 PM"
        massage32.text = ":) I can't wait to create this messenger Application and show all my friends!"
        massage32.sender = user2
        
        var convesation1 = Conversation()
        convesation1.user = user1
        convesation1.massages = [massage11, massage21, massage31]
        
        var convesation2 = Conversation()
        convesation2.user = user2
        convesation2.massages = [massage12, massage22, massage32]
        
//        chats = [convesation1, convesation2]
       
    }
    
    private func addMassage(_ msg: String, _friend: Friend){
        var massage = Massage()
        
//        massage.date = "03:22 PM"
        massage.text = msg
        massage.sender = user2
        
        
    }
    
}














