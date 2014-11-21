Chitter
=======
Makers Academy Week 4 Challenge to write a little Twitter clone that will allow the users to post messages to a public stream.

Features
--------
* In order to use chitter as a maker I want to sign up to the service
* In order to user chitter as a maker I want to log in
* In order to avoid others to use my account as a maker I want to log out
* In order to let people know what I am doing as a maker I want to post a message to chitter
* In order to see what people have to say as a maker I want to see all peeps in chronological order

Bonus
-----
If you have time you can implement the following:
* In order to start a conversation as a maker I want to reply to a peep from another maker.
* Work on the css to make it look good (we all like beautiful things).

Domain Model
------------
Classes:
* User
* Post/'peep'
* Email Message

###User
| Responsibiities | Collaborators |
|-----------------|---------------|
| Have a unique username | Post |
| Make posts (have n posts) | Email |
| View posts |  |
| Reply to posts |  |
| Log in |  |
| Log out |  |
| Reset password |  |

###Post
| Responsibiities | Collaborators |
|-----------------|---------------|
| Contain text |  |
| Have a submission time/timestamp |  |
| Be submitted by a user (belong to a user) |  |

###Email
| Responsibiities | Collaborators |
|-----------------|---------------|
| Email users with account confirmation | User |
| Email users with password reset | User |
