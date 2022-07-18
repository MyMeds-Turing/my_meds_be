# README
## GraphQL
Our GraphQL endpoints fall into two categories: queries and mutations.

### Queries

1. [**fetchUser(id: ID)**](#fetch-user) *Finds a specific user in the database*
* Example Query
```
{
  fetchUser(id: 1) {
    id
    firstName
    lastName
    fullName
    email
    sms
    notify
    createdAt
    updatedAt
  }
}
```
  * Example Response
```
{
  "data": {
    "fetchUser": {
      "id": "1",
      "firstName": "John",
      "lastName": "L",
      "fullName": "John L",
      "email": "John.H@email.com",
      "sms": "5551234567",
      "notify": 0,
      "createdAt": "2022-07-13T23:17:33Z",
      "updatedAt": "2022-07-13T23:17:33Z"
    }
  }
}
```

2. [**fetchUsers**](#fetch-users) *list all users in the database*
* Example Query
```
{
      fetchUsers {
        id
        firstName
        lastName
        fullName
        email
        sms
        notify
        createdAt
        updatedAt
      }
}
```
  * Example Response
  ```
  {
  "data": {
    "fetchUsers": [
      {
        "id": "1",
        "firstName": "John",
        "lastName": "L",
        "fullName": "John L",
        "email": "John.H@email.com",
        "sms": "5551234567",
        "notify": 0,
        "createdAt": "2022-07-13T23:17:33Z",
        "updatedAt": "2022-07-13T23:17:33Z"
      },
      {
        "id": "2",
        "firstName": "Paul",
        "lastName": "M",
        "fullName": "Paul M",
        "email": "Paul.M@email.com",
        "sms": "5551234567",
        "notify": 0,
        "createdAt": "2022-07-13T23:17:33Z",
        "updatedAt": "2022-07-13T23:17:33Z"
      }
    ]
  }
}
```
3. [**fetchRxs**](#fetch-rxs) *list all prescriptions in the database*
* Example Query
```
{
  fetchRxs {
    id
    medName
    timeOfLastDose
    timeOfNextDose
    totalDoses
    dosesRemaining
    maxDailyDoses
    dose
    userInstructions
    additionalInstructions
    timeBetweenDose
    icon
    userId
    createdAt
    updatedAt
  }
}
```
  * Example Response
```
{
  "data": {
    "fetchRxs": [
      {
        "id": "1",
        "medName": "Tylenol",
        "timeOfLastDose": "2022-07-13T23:17:33Z",
        "timeOfNextDose": "2022-07-14T23:17:33Z",
        "totalDoses": 500,
        "dosesRemaining": 500,
        "maxDailyDoses": 6,
        "dose": "200 mg",
        "userInstructions": "take pill, take with food",
        "additionalInstructions": "take 2 call me in the morning",
        "timeBetweenDose": 240,
        "icon": "path_to_icon",
        "userId": 1,
        "createdAt": "2022-07-13T23:17:33Z",
        "updatedAt": "2022-07-13T23:17:33Z"
      },
      {
        "id": "2",
        "medName": "Tylenol",
        "timeOfLastDose": "2022-07-13T23:17:33Z",
        "timeOfNextDose": "2022-07-17T23:17:33Z",
        "totalDoses": 500,
        "dosesRemaining": 500,
        "maxDailyDoses": 6,
        "dose": "200 mg",
        "userInstructions": "take pill, take with food",
        "additionalInstructions": "take 2 call me in the morning",
        "timeBetweenDose": 240,
        "icon": "path_to_icon",
        "userId": 2,
        "createdAt": "2022-07-13T23:17:33Z",
        "updatedAt": "2022-07-13T23:17:33Z"
      },
      {
        "id": "3",
        "medName": "OxyContin",
        "timeOfLastDose": "2022-07-13T23:17:33Z",
        "timeOfNextDose": "2022-07-15T23:17:33Z",
        "totalDoses": 25,
        "dosesRemaining": 25,
        "maxDailyDoses": 4,
        "dose": "5mg",
        "userInstructions": "take pill, take with food",
        "additionalInstructions": "take 2 call me in the morning",
        "timeBetweenDose": 240,
        "icon": "path_to_icon",
        "userId": 1,
        "createdAt": "2022-07-13T23:17:33Z",
        "updatedAt": "2022-07-13T23:17:33Z"
      }
    ]
  }
}
```

4. [**fetchUserRxs(id: ID)**](#fetch-user-rxs) *list all prescriptions in the database by user id*
* Example Query
```
{
  fetchUserRxs(id: 1) {
    id
    medName
    timeOfLastDose
    timeOfNextDose
    totalDoses
    dosesRemaining
    maxDailyDoses
    dose
    userInstructions
    additionalInstructions
    timeBetweenDose
    icon
    userId
    createdAt
    updatedAt
  }
}
```
  * Example Response
```
{
  "data": {
    "fetchUserRxs": [
      {
        "id": "1",
        "medName": "Tylenol",
        "timeOfLastDose": "2022-07-13T23:17:33Z",
        "timeOfNextDose": "2022-07-14T23:17:33Z",
        "totalDoses": 500,
        "dosesRemaining": 500,
        "maxDailyDoses": 6,
        "dose": "200 mg",
        "userInstructions": "take pill, take with food",
        "additionalInstructions": "take 2 call me in the morning",
        "timeBetweenDose": 240,
        "icon": "path_to_icon",
        "userId": 1,
        "createdAt": "2022-07-13T23:17:33Z",
        "updatedAt": "2022-07-13T23:17:33Z"
      },
      {
        "id": "3",
        "medName": "OxyContin",
        "timeOfLastDose": "2022-07-13T23:17:33Z",
        "timeOfNextDose": "2022-07-15T23:17:33Z",
        "totalDoses": 25,
        "dosesRemaining": 25,
        "maxDailyDoses": 4,
        "dose": "5mg",
        "userInstructions": "take pill, take with food",
        "additionalInstructions": "take 2 call me in the morning",
        "timeBetweenDose": 240,
        "icon": "path_to_icon",
        "userId": 1,
        "createdAt": "2022-07-13T23:17:33Z",
        "updatedAt": "2022-07-13T23:17:33Z"
      },
      {
        "id": "4",
        "medName": "Motrin",
        "timeOfLastDose": "2022-07-13T23:17:33Z",
        "timeOfNextDose": "2022-07-14T15:17:33Z",
        "totalDoses": 250,
        "dosesRemaining": 250,
        "maxDailyDoses": 4,
        "dose": "200mg",
        "userInstructions": "take pill, take with food",
        "additionalInstructions": "take 2 call me in the morning",
        "timeBetweenDose": 240,
        "icon": "path_to_icon",
        "userId": 1,
        "createdAt": "2022-07-13T23:17:33Z",
        "updatedAt": "2022-07-13T23:17:33Z"
      }
    ]
  }
}
```

## Mutations
1. [**addRx**](#addrx) *creates an entry in the prescription table*
* Available input fields
```
mutation {
     addRx(input: { params: {
        medName: "Asprin",
        totalDoses: 100,
        maxDailyDoses: 12,
        dose: "25 mg",
        userInstructions: "takepill, take with food",
        additionalInstructions: "take 2 a day",
        timeBetweenDose: 15,
        icon: "path_to_icon",
        userId: 1   
    }}){
    rx {
        id
        medName
    }
    }
    }
```
  * Example Response
```  
{
    "data": {
        "addRx": {
            "rx": {
                "id": "9",
                "medName": "Asprin"
            }
        }
    }
}
```
2. [**deleteRx(id: ID)**](#delete-rx) *Deletes a prescription from the database*
* Example Mutation
```
{
  deleteRx(input: {id: 1}  ) {
          id
        }
      }
```
  * Example Response
```
{
  "data": {
    "deleteRx": {
      "id": "1"
    }
  }
}
```
3. [**updateRx**](#updaterx) *updates an entry in the prescription table*
* Available input fields
