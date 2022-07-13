# Superwarden Developer Docs

## Our Part 1 Development

I had divided the development into two part: townhall creation (Part 1) & proposal and voting (Part 2). From 15/6 onwards, we will start the Part 1 development. Don't worry about Part 2, I will prepare another developer doc for that. But first, let's focus on Part 1 Development!

#### Goal to be achieved after Part 1 is done (checklist ✅):
* The World Page is done (sidebar, search function, filter function, grid list of townhalls)
* Townhall page is done (profile card, proposal tab (section), announcement tab (section), details (section), create announcement function)
* User can create townhall
* User can join townhall
* All the roles ability are correct (should not have cases where villager has superwarden ability, NO!)
* Can create announcements and be listed

## 🏰 What is a Townhall?
Townhall is the same as the Space in Snapshot, which is all the activity of a DAO community take place. Anyone who create a townhall will automatically become a superwarden of the townhall. Here are 4 main features that a townhall should achieve in this prototype:
1. Display the profile of the townhall
2. Announcement section (create and publish an announcement. All the announcements of DAO will list here)
3. Proposal section (create and publish a proposal. All the proposals of DAO will list here. User can click and enter the proposal page and voting section - just like Snapshot)
4. Details Section (user will upload a markdown file of a more detail introduction of their DAO during the townhall creating form. The markdown file content will be parsed and display in this section.)

## Understanding the roles and abilities
### Superwarden:
1. The one who create the townhall and has the highest admin power
2. Can assign and remove warden
3. Can assign and remove master
4. Can edit settings of townhall
5. Can create and publish proposals
6. Can delete the townhall
7. Can create a townhall announcement

* Note: One wallet address (user) can only be a superwarden once, which means each user can only create one townhall and become the superwarden of it (this is to reduce spam). However, a user can become warden or master of multiple townhall, that's not a problem. 

### Warden:
1. Assigned by superwarden
2. Cannot remove superwarden
3. Cannot delete the townhall
4. Cannot assign or remove other warden
5. Can assign and remove master
6. Can create and publish proposals
7. Can create a townhall announcement

### Master:
1. Assigned by superwarden or warden
2. Only can create and publish proposals, nothing else

### Villager:
1. Anyone can join any townhall as a villager
2. Only have the ability to vote, noting else
3. A villager can vote if have the specified DAOs token (TRC-20) or NFT (TRC-721)

## The flow of creating a townhall (frontend and behind the scene)
**1.** User need to connect his/her Tronlink wallet and click the `create a townhall` button. Then, we need to check this Tronlink wallet address in our database:

* Is the user new to our platform (never connect his/her wallet here before)? If new, register the user in our DB and allow user to proceed with **step 2**. If no, proceed to next check 👇:

* Is the user created a townhall before (because one user address can only create one townhall, this is to avoid one wallet spamming)? If yes, display error message which tells the user he/her has no quota left to create a townhall. If no, allow user to proceed with **step 2**.

**2.** User will need to undergo this basic townhall setup (**a multiple-step form**), which user need to input:

#### Step 1 of the form: profile section

* Name of the townhall (check the DB, if there is duplication exist (the name had been used by others), throw error messages and tell user to retry.)

* Categories (this is a "choose two" multiple option form, user need to choose two category that best describe their DAO)
* Bio for the townhall (150 character MAX: this is important as this bio is just for the profile card, which no long bio should allow.)
* Avatar (Recommended size: 250 * 250. This is a link to the image, hence we will not need to store this in our DB)
* Cover photo (Recommended size: 1920 * 600. This is also a link to the image)
* Slug (This will become the URL slug. For example: user input - mydao as the slug. Our system will automatically add a .tron at the back. This will result: superwarden.org/mydao.tron)
  * All slug need to be lowercase down before storing in DB
  * We need to check the duplication of slug in DB, if the slug exists, user cannot use it anymore and will receive an error to retry.
  * For example: MyDAO = mydao
* Social Media: Twitter, Discord, Website/Forum, Github
* Details (this will be displayed at the detail section of townhall and it is a more detail description of the DAO. User can upload a markdown file which will later parse and displayed as content in the section)
* Terms (User may upload a link to their DAO's term and condition website page)
* Decentralised Storage: Web3.storage API key, Pinata API key, Pinata API Secret (Note: same as IPFS blog engine, Web3.storage is the main storage to store the voting proposal result snapshot: A JSON data file, while Pinata act as an additional pinning, which take the CID from Web3.storage and pin the CID key.)
* Private Townhall (This is a checkbox, if the user check to be a private townhall, it will not appear in the main page and search, however it can still be access by using URL link. For example: superwarden.org/mydao.tron)

#### Step 2 of the form: Role Assign

* Wardens' addresses (User as a superwarden can assign warden. He/her can input a list of addresses to be the wardens of this townhall.)

* Masters' addresses (User as a superwarden can assign master. He/her can input a list of addresses to be the masters of this townhall.)

#### Step 3 of the form: Proposal Publishing Permission

* User need to choose the proposal publishing permission (who can have the ability to post proposal. There are three option (user can choose one or multiple):
1. **Allow masters to post proposals** (Default, can't be unticked, as if other two option is not chosen, this permission must be applied.)

2. **Anyone who exceeds the token threshold** (If check this, user need to input token symbol, address, and threshold. This means that, if a token in the user(whatever role) wallet have exceed the token threshold set, the user can create a proposal. For example, threshold is: 20 ETH, if the user has 20 ETH in his/her wallet, user can create a proposal.)

3. **Anyone with a specific TRC721** (If check this, user need to input token(or we can say NFT) symbol and address. This means that if the user wallet has a NFT token in the stated collection(address), he/her can create a proposal.)

## The flow of joining a townhall (As a user)

1. When a user first time visit the website and connect his/her Tronlink wallet, we need to immediately register this user in our database. (Even though the user didnt do anything after connecting the wallet, but we will take it as a successful signup of the user.)

2. The user can now search any townhall in the homepage and click the `join` button.
   * We will then add the townhalls which the user joined in his/her user database (so we can know what townhall joined by each user through the database)
   * We also need to store the user address in the villager database of the respective townhall (so we can use this data to calculate the amount of villager who join the townhall)

3. After the user become a villager of the townhall, the sidebar will appear the townhall avatar (Button which link to the townhall: just like discord server sidebar OR the Space sidebar of Snapshot)

4. When there is new proposal or announcement published by the townhall, the sidebar townhall avatar will have a number in a small dot. This means there are new things which the user haven't read about it. 

## The flow of publishing a townhall announcement

1. User will visit the announcement tab of the townhall. Click the `Broadcast Announcement` button.
   * We need to check whether the user is a superwarden or a warden, as only this two role can publish an announcement.
   * If the user is not a superwarden or warden, throw an error message.
   * If yes, proceed to **step 2** 👇:

2. User will need to complete the announcement creation form:
   * Title of announcement
   * Summary
   * Link (User may add URL link in the announcement)
   * Important announcement boardcast? (this is a checkbox, if the user check it, the announcement will be flagged **`important`** when displayed)

3. Afte the form is done, click the `Broadcast` button to post the announcement.

4. The submitted announcement will be stored in the townhall database and all the database will be rendered as a list in the announcement section.

## Everything about the homepage (World 🌍)

\*\* We will call our application homepage: **World**. This is because all the townhalls created will be displayed here. Just like a whole world! I will use the term **World** below.

1. The World URL link should be: [**app.superwarden.org**](app.superwarden.org). This is because superwarden.org is for the landing website (which include all the info), user need to click `Launch App` button to link to our application URL. However, we will talk about the landing website later (not in our current plan).

2. When user visit the World, they will see:
   * A townhall sidebar, which all the townhalls the user joined will be listed in the sidebar.
   * Grid list of all the townhalls created in Superwarden (render and displayed all the townhalls in the DB)
   * Search bar to search for the townhall
   * Filter to filter townhall by categories
   * A `Connect Wallet` button (Tronlink Wallet)
  
  \*\* As you can see, the World page (homepage) is almost similar to the Snapshot homepage
  
  ## Everything about a townhall page
  
  \*\* When we simple click a townhall we choose at the World page, we will be link to the respective townhall page.
  
  1. In the townhall page, we have:
     * A townhall sidebar, which all the townhalls the user joined will be listed in the sidebar. (This sidebar always will be displayed no matter what page)
     * A profile card with simple townhall info (same as Snapshot)
     * Three tab:
       * Proposals (This is the first tab displayed in default, all the proposals of the townhall will be listed here.)
       * Announcements (This is the second townhall, when we click it, it will switch from proposal section to the announcement section. All the annoucnements will be lsited here.)
       * Details (This is where the detail DAO introduction will be rendered. Remember that user had submitted a more detail introduction of their DAO in markdown format during the townhall creation multistep form.)
      * The proposal tab will have a `Create Proposal` button, this will link to a Proposal Creation form (this is our PART 2 DEVELOPMENT, don't be worry)
      * The announcement section will have a `Broadcast Announcement` button, this will link to an Announcement Creation form (as mentioned [above](#the-flow-of-publishing-a-townhall-announcement))







