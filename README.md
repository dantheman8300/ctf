# ctf

## Slipspace Rupture Challenge

### Challenge Description
Locate the slipspace rupture, wait for it to open, and extract the artifact before it closes.

### Instructions
1. Examine the `slipspace_rupture.move` contract carefully
1. Locate the slipspace rupture object that's in the network. 
1. Determine when the rupture will next open.
1. Extract the artifact before it closes.

### Hints
1. The rupture object is a globally shared object that was created when the contract was deployed. Find the transaction of the deployment and locate the rupture object.
1. The rupture object has information about when it will next open. 

## Forerunner Database Challenge

### Challenge Description
The forerunner database is a globally shared object that holds thousands of special items including some artifacts. Locate the database object and extract the artifact. 

### Instructions
1. Examine the `forerunner_database.move` contract carefully
1. Locate the forerunner database object that's in the network. 
1. Find a key to extract the artifact.
1. Extract the artifact.

### Hints
1. The database object is a globally shared object that was created when the contract was deployed. Find the transaction of the deployment and locate the database object.
1. The database contains a list of dynamic object fields, including some artifacts. Look at all of the dynamic object fields and find one that contains an artifact.
