# PreInteractionNotificationReceiver


Interface for interactor which acts between `maker => taker` and `taker => maker` transfers.




## Functions
### fillOrderPreInteraction
```solidity
function fillOrderPreInteraction(
  address taker,
  address makerAsset,
  address takerAsset,
  uint256 makingAmount,
  uint256 takingAmount,
  bytes interactiveData
) external
```


#### Parameters:
| Name | Type | Description                                                          |
| :--- | :--- | :------------------------------------------------------------------- |
|`taker` | address | 
|`makerAsset` | address | 
|`takerAsset` | address | 
|`makingAmount` | uint256 | 
|`takingAmount` | uint256 | 
|`interactiveData` | bytes | 


