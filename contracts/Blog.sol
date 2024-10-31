// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Blog {

    struct BlogPost {
        address owner;
        string title;
        string content;
        uint256 id;
        uint256 timestamp;
        uint256 commentsCount;
    }

    struct Comment {
        address commenter;
        string content;
        uint256 timestamp;
    }

    mapping(uint256 => BlogPost) public posts;
    mapping(address => BlogPost[]) public userPosts;
    mapping(uint256 => Comment[]) public postComments;

    uint256 public postCounter;
    address public owner;

    event PostCreated(
        uint256 indexed id,
        string title,
        string content,
        address owner,
        uint256 timestamp,
        uint256 commentsCount
    );
    event CommentAdded(
        uint256 indexed postId,
        string content,
        address commenter,
        uint256 timestamp
    );

    constructor() {
        owner = msg.sender;
        postCounter = 0;
    }

    function createPost(string memory _title, string memory _content, uint256 _timestamp) public {
        BlogPost memory newPost = BlogPost({
            owner: msg.sender,
            title: _title,
            content: _content,
            id: postCounter,
            timestamp: _timestamp,
            commentsCount: 0
        });
        
        posts[postCounter] = newPost;
        userPosts[msg.sender].push(newPost);
        
        emit PostCreated(postCounter, _title, _content, msg.sender, _timestamp, 0);
        
        postCounter++;
    }

   
    function getMyPosts() public view returns (BlogPost[] memory) {
        return userPosts[msg.sender];
    }

   
    function commentOnPost(uint256 _postId, string memory _content, uint256 _timestamp) public {
        
        require(_postId < postCounter, "Post does not exist");
        
       
        Comment memory newComment = Comment({
            commenter: msg.sender,
            content: _content,
            timestamp: _timestamp
        });

       
        postComments[_postId].push(newComment);
        
        
        posts[_postId].commentsCount++;

        emit CommentAdded(_postId, _content, msg.sender, _timestamp);
    }

    
    function getComments(uint256 _postId) public view returns (Comment[] memory) {
       
        require(_postId < postCounter, "Post does not exist");
        
        
        return postComments[_postId];
    }
}
