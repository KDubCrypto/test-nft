contract NFT {

    // The name of the NFT.
    string public name;

    // The image of the NFT.
    string public image;

    // The description of the NFT.
    string public description;

    // The owner of the NFT.
    address public owner;

    // The first oracle address.
    address public firstOracle;

    // The second oracle address.
    address public secondOracle;

    // The first condition.
    uint public firstCondition;

    // The second condition.
    uint public secondCondition;

    // The third condition.
    uint public thirdCondition;

    // The constructor of the NFT.
    constructor(string _name, string _image, string _description, address _firstOracle, address _secondOracle, uint _firstCondition, uint _secondCondition, uint _thirdCondition) {
        name = _name;
        image = _image;
        description = _description;
        firstOracle = _firstOracle;
        secondOracle = _secondOracle;
        firstCondition = _firstCondition;
        secondCondition = _secondCondition;
        thirdCondition = _thirdCondition;
        owner = msg.sender;
    }

    // The function to transfer ownership of the NFT.
    function transfer(address _newOwner) public {
        require(msg.sender == owner);
        owner = _newOwner;
    }

    // The function to get the name of the NFT.
    function getName() public view returns (string) {
        return name;
    }

    // The function to get the image of the NFT.
    function getImage() public view returns (string) {
        return image;
    }

    // The function to get the description of the NFT.
    function getDescription() public view returns (string) {
        return description;
    }

    // The function to get the first condition of the NFT.
    function getFirstCondition() public view returns (uint) {
        return firstCondition;
    }

    // The function to get the second condition of the NFT.
    function getSecondCondition() public view returns (uint) {
        return secondCondition;
    }

    // The function to get the third condition of the NFT.
    function getThirdCondition() public view returns (uint) {
        return thirdCondition;
    }

    // The function to check if the NFT is minted.
    function isMinted() public view returns (bool) {
        return (owner != address(0));
    }

    // The function to mint the NFT.
    function mint() public {
        require(!isMinted());
        require(firstCondition > 0 && secondCondition > 0 && thirdCondition > 0);
        require(firstOracle.call(bytes4(sha3("isTrue(uint256)")))(firstCondition));
        require(secondOracle.call(bytes4(sha3("isTrue(uint256)")))(secondCondition));
        require(thirdOracle.call(bytes4(sha3("isTrue(uint256)")))(thirdCondition));
        owner = msg.sender;
    }
}
