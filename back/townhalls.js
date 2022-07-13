/*
 Navicat Premium Data Transfer

 Source Server         : local_MongoDB
 Source Server Type    : MongoDB
 Source Server Version : 50008
 Source Host           : localhost:27017
 Source Schema         : superwarden

 Target Server Type    : MongoDB
 Target Server Version : 50008
 File Encoding         : 65001

 Date: 30/06/2022 10:35:49
*/


// ----------------------------
// Collection structure for townhalls
// ----------------------------
db.getCollection("townhalls").drop();
db.createCollection("townhalls");

// ----------------------------
// Documents of townhalls
// ----------------------------
db.getCollection("townhalls").insert([ {
    _id: ObjectId("62b8961bfd30b4e290b425b5"),
    superwarden: "TVSPxScHmwoQP3TG4EkAGtbu6nrvmjTgMs",
    villagers: [
        ObjectId("62b89491fd30b4e290b4258f"),
        ObjectId("62b89555fd30b4e290b425aa"),
        ObjectId("62b8954cfd30b4e290b425a2"),
        ObjectId("62b89546fd30b4e290b4259e")
    ],
    details: {
        name: "mystriousErrorFixed",
        categories: [
            "Media",
            "Creator"
        ],
        bio: "I don't know why now It is crystal clear\nBut now everything is okay?\none",
        avatar: "https://randomuser.me/api/portraits/med/men/2.jpg",
        coverPhoto: "https://randomuser.me/api/portraits/med/men/1.jpg",
        slug: "mystrious",
        bannerPhoto: "https://randomuser.me/api/portraits/med/women/1.jpg",
        details: "# Superwarden Developer Docs\r\n\r\n## Our Part 1 Development\r\n\r\nI had divided the development into two part: townhall creation (Part 1) & proposal and voting (Part 2). From 15/6 onwards, we will start the Part 1 development. Don't worry about Part 2, I will prepare another developer doc for that. But first, let's focus on Part 1 Development!\r\n\r\n#### Goal to be achieved after Part 1 is done (checklist ✅):\r\n* The World Page is done (sidebar, search function, filter function, grid list of townhalls)\r\n* Townhall page is done (profile card, proposal tab (section), announcement tab (section), details (section), create announcement function)\r\n* User can create townhall\r\n* User can join townhall\r\n* All the roles ability are correct (should not have cases where villager has superwarden ability, NO!)\r\n* Can create announcements and be listed\r\n\r\n## 🏰 What is a Townhall?\r\nTownhall is the same as the Space in Snapshot, which is all the activity of a DAO community take place. Anyone who create a townhall will automatically become a superwarden of the townhall. Here are 4 main features that a townhall should achieve in this prototype:\r\n1. Display the profile of the townhall\r\n2. Announcement section (create and publish an announcement. All the announcements of DAO will list here)\r\n3. Proposal section (create and publish a proposal. All the proposals of DAO will list here. User can click and enter the proposal page and voting section - just like Snapshot)\r\n4. Details Section (user will upload a markdown file of a more detail introduction of their DAO during the townhall creating form. The markdown file content will be parsed and display in this section.)\r\n\r\n## Understanding the roles and abilities\r\n### Superwarden:\r\n1. The one who create the townhall and has the highest admin power\r\n2. Can assign and remove warden\r\n3. Can assign and remove master\r\n4. Can edit settings of townhall\r\n5. Can create and publish proposals\r\n6. Can delete the townhall\r\n7. Can create a townhall announcement\r\n\r\n* Note: One wallet address (user) can only be a superwarden once, which means each user can only create one townhall and become the superwarden of it (this is to reduce spam). However, a user can become warden or master of multiple townhall, that's not a problem. \r\n\r\n### Warden:\r\n1. Assigned by superwarden\r\n2. Cannot remove superwarden\r\n3. Cannot delete the townhall\r\n4. Cannot assign or remove other warden\r\n5. Can assign and remove master\r\n6. Can create and publish proposals\r\n7. Can create a townhall announcement\r\n\r\n### Master:\r\n1. Assigned by superwarden or warden\r\n2. Only can create and publish proposals, nothing else\r\n\r\n### Villager:\r\n1. Anyone can join any townhall as a villager\r\n2. Only have the ability to vote, noting else\r\n3. A villager can vote if have the specified DAOs token (TRC-20) or NFT (TRC-721)\r\n\r\n## The flow of creating a townhall (frontend and behind the scene)\r\n**1.** User need to connect his/her Tronlink wallet and click the `create a townhall` button. Then, we need to check this Tronlink wallet address in our database:\r\n\r\n* Is the user new to our platform (never connect his/her wallet here before)? If new, register the user in our DB and allow user to proceed with **step 2**. If no, proceed to next check 👇:\r\n\r\n* Is the user created a townhall before (because one user address can only create one townhall, this is to avoid one wallet spamming)? If yes, display error message which tells the user he/her has no quota left to create a townhall. If no, allow user to proceed with **step 2**.\r\n\r\n**2.** User will need to undergo this basic townhall setup (**a multiple-step form**), which user need to input:\r\n\r\n#### Step 1 of the form: profile section\r\n\r\n* Name of the townhall (check the DB, if there is duplication exist (the name had been used by others), throw error messages and tell user to retry.)\r\n\r\n* Categories (this is a \"choose two\" multiple option form, user need to choose two category that best describe their DAO)\r\n* Bio for the townhall (150 character MAX: this is important as this bio is just for the profile card, which no long bio should allow.)\r\n* Avatar (Recommended size: 250 * 250. This is a link to the image, hence we will not need to store this in our DB)\r\n* Cover photo (Recommended size: 1920 * 600. This is also a link to the image)\r\n* Slug (This will become the URL slug. For example: user input - mydao as the slug. Our system will automatically add a .tron at the back. This will result: superwarden.org/mydao.tron)\r\n  * All slug need to be lowercase down before storing in DB\r\n  * We need to check the duplication of slug in DB, if the slug exists, user cannot use it anymore and will receive an error to retry.\r\n  * For example: MyDAO = mydao\r\n* Social Media: Twitter, Discord, Website/Forum, Github\r\n* Details (this will be displayed at the detail section of townhall and it is a more detail description of the DAO. User can upload a markdown file which will later parse and displayed as content in the section)\r\n* Terms (User may upload a link to their DAO's term and condition website page)\r\n* Decentralised Storage: Web3.storage API key, Pinata API key, Pinata API Secret (Note: same as IPFS blog engine, Web3.storage is the main storage to store the voting proposal result snapshot: A JSON data file, while Pinata act as an additional pinning, which take the CID from Web3.storage and pin the CID key.)\r\n* Private Townhall (This is a checkbox, if the user check to be a private townhall, it will not appear in the main page and search, however it can still be access by using URL link. For example: superwarden.org/mydao.tron)\r\n\r\n#### Step 2 of the form: Role Assign\r\n\r\n* Wardens' addresses (User as a superwarden can assign warden. He/her can input a list of addresses to be the wardens of this townhall.)\r\n\r\n* Masters' addresses (User as a superwarden can assign master. He/her can input a list of addresses to be the masters of this townhall.)\r\n\r\n#### Step 3 of the form: Proposal Publishing Permission\r\n\r\n* User need to choose the proposal publishing permission (who can have the ability to post proposal. There are three option (user can choose one or multiple):\r\n1. **Allow masters to post proposals** (Default, can't be unticked, as if other two option is not chosen, this permission must be applied.)\r\n\r\n2. **Anyone who exceeds the token threshold** (If check this, user need to input token symbol, address, and threshold. This means that, if a token in the user(whatever role) wallet have exceed the token threshold set, the user can create a proposal. For example, threshold is: 20 ETH, if the user has 20 ETH in his/her wallet, user can create a proposal.)\r\n\r\n3. **Anyone with a specific TRC721** (If check this, user need to input token(or we can say NFT) symbol and address. This means that if the user wallet has a NFT token in the stated collection(address), he/her can create a proposal.)\r\n\r\n## The flow of joining a townhall (As a user)\r\n\r\n1. When a user first time visit the website and connect his/her Tronlink wallet, we need to immediately register this user in our database. (Even though the user didnt do anything after connecting the wallet, but we will take it as a successful signup of the user.)\r\n\r\n2. The user can now search any townhall in the homepage and click the `join` button.\r\n   * We will then add the townhalls which the user joined in his/her user database (so we can know what townhall joined by each user through the database)\r\n   * We also need to store the user address in the villager database of the respective townhall (so we can use this data to calculate the amount of villager who join the townhall)\r\n\r\n3. After the user become a villager of the townhall, the sidebar will appear the townhall avatar (Button which link to the townhall: just like discord server sidebar OR the Space sidebar of Snapshot)\r\n\r\n4. When there is new proposal or announcement published by the townhall, the sidebar townhall avatar will have a number in a small dot. This means there are new things which the user haven't read about it. \r\n\r\n## The flow of publishing a townhall announcement\r\n\r\n1. User will visit the announcement tab of the townhall. Click the `Broadcast Announcement` button.\r\n   * We need to check whether the user is a superwarden or a warden, as only this two role can publish an announcement.\r\n   * If the user is not a superwarden or warden, throw an error message.\r\n   * If yes, proceed to **step 2** 👇:\r\n\r\n2. User will need to complete the announcement creation form:\r\n   * Title of announcement\r\n   * Summary\r\n   * Link (User may add URL link in the announcement)\r\n   * Important announcement boardcast? (this is a checkbox, if the user check it, the announcement will be flagged **`important`** when displayed)\r\n\r\n3. Afte the form is done, click the `Broadcast` button to post the announcement.\r\n\r\n4. The submitted announcement will be stored in the townhall database and all the database will be rendered as a list in the announcement section.\r\n\r\n## Everything about the homepage (World 🌍)\r\n\r\n\\*\\* We will call our application homepage: **World**. This is because all the townhalls created will be displayed here. Just like a whole world! I will use the term **World** below.\r\n\r\n1. The World URL link should be: [**app.superwarden.org**](app.superwarden.org). This is because superwarden.org is for the landing website (which include all the info), user need to click `Launch App` button to link to our application URL. However, we will talk about the landing website later (not in our current plan).\r\n\r\n2. When user visit the World, they will see:\r\n   * A townhall sidebar, which all the townhalls the user joined will be listed in the sidebar.\r\n   * Grid list of all the townhalls created in Superwarden (render and displayed all the townhalls in the DB)\r\n   * Search bar to search for the townhall\r\n   * Filter to filter townhall by categories\r\n   * A `Connect Wallet` button (Tronlink Wallet)\r\n  \r\n  \\*\\* As you can see, the World page (homepage) is almost similar to the Snapshot homepage\r\n  \r\n  ## Everything about a townhall page\r\n  \r\n  \\*\\* When we simple click a townhall we choose at the World page, we will be link to the respective townhall page.\r\n  \r\n  1. In the townhall page, we have:\r\n     * A townhall sidebar, which all the townhalls the user joined will be listed in the sidebar. (This sidebar always will be displayed no matter what page)\r\n     * A profile card with simple townhall info (same as Snapshot)\r\n     * Three tab:\r\n       * Proposals (This is the first tab displayed in default, all the proposals of the townhall will be listed here.)\r\n       * Announcements (This is the second townhall, when we click it, it will switch from proposal section to the announcement section. All the annoucnements will be lsited here.)\r\n       * Details (This is where the detail DAO introduction will be rendered. Remember that user had submitted a more detail introduction of their DAO in markdown format during the townhall creation multistep form.)\r\n      * The proposal tab will have a `Create Proposal` button, this will link to a Proposal Creation form (this is our PART 2 DEVELOPMENT, don't be worry)\r\n      * The announcement section will have a `Broadcast Announcement` button, this will link to an Announcement Creation form (as mentioned [above](#the-flow-of-publishing-a-townhall-announcement))\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n",
        discord: "https://randomuser.me/softAngel",
        forum: "https://randomuser.me/softAngel",
        github: "https://randomuser.me/softAngel",
        master: "dd, \nbb",
        "mtr_status": false,
        pinataKey: "dfaaaaaaaaaaaaaa",
        pinataSecret: "zxcccccccccccccccvvvvvvvvvvvvvvv",
        private: false,
        tcr: {
            status: false,
            "tk_symbol": "",
            "tk_addr": ""
        },
        threshold: {
            status: false,
            "tk_symbol": "",
            "tk_addr": "",
            threshold: ""
        },
        twitter: "https://randomuser.me/softAngel",
        warden: "aa",
        webThrKey: "vvvvvvvvvvvvvvvvvvvvvv"
    },
    "created_at": ISODate("2022-06-26T17:23:39.103Z"),
    "updated_at": ISODate("2022-06-30T01:46:20.508Z"),
    "deleted_at": null,
    __v: NumberInt("0")
} ]);
db.getCollection("townhalls").insert([ {
    _id: ObjectId("62b896a5fd30b4e290b425c2"),
    superwarden: "ff",
    villagers: [
        ObjectId("62b89559fd30b4e290b425ae"),
        ObjectId("62b89546fd30b4e290b4259e"),
        ObjectId("62b89491fd30b4e290b4258f")
    ],
    details: {
        name: "vbfg",
        categories: [
            "Social"
        ],
        bio: "sfg",
        avatar: "https://randomuser.me/api/portraits/med/men/1.jpg",
        coverPhoto: "",
        slug: "",
        twitter: "",
        discord: "",
        github: "",
        forum: "",
        details: "",
        bannerPhoto: "",
        webThrKey: "",
        pinataKey: "",
        pinataSecret: "",
        private: false,
        master: "",
        warden: [
            "aa"
        ],
        "mtr_status": false,
        threshold: {
            status: false,
            "tk_symbol": "",
            "tk_addr": "",
            threshold: ""
        },
        tcr: {
            status: false,
            "tk_symbol": "",
            "tk_addr": ""
        }
    },
    "created_at": ISODate("2022-06-26T17:25:57.37Z"),
    "updated_at": ISODate("2022-06-26T17:25:57.37Z"),
    "deleted_at": null,
    __v: NumberInt("0")
} ]);
db.getCollection("townhalls").insert([ {
    _id: ObjectId("62b996a5fd30b4e290b425c2"),
    superwarden: "ff",
    villagers: [
        ObjectId("62b89559fd30b4e290b425ae"),
        ObjectId("62b89546fd30b4e290b4259e"),
        ObjectId("62b89491fd30b4e290b4258f")
    ],
    details: {
        name: "vbfg",
        categories: [
            "Social"
        ],
        bio: "sfg",
        avatar: "https://randomuser.me/api/portraits/med/men/1.jpg",
        coverPhoto: "",
        slug: "",
        twitter: "",
        discord: "",
        github: "",
        forum: "",
        details: "",
        bannerPhoto: "",
        webThrKey: "",
        pinataKey: "",
        pinataSecret: "",
        private: false,
        master: "",
        warden: [
            "aa"
        ],
        "mtr_status": false,
        threshold: {
            status: false,
            "tk_symbol": "",
            "tk_addr": "",
            threshold: ""
        },
        tcr: {
            status: false,
            "tk_symbol": "",
            "tk_addr": ""
        }
    },
    "created_at": ISODate("2022-06-26T17:25:57.37Z"),
    "updated_at": ISODate("2022-06-26T17:25:57.37Z"),
    "deleted_at": null,
    __v: NumberInt("0")
} ]);
db.getCollection("townhalls").insert([ {
    _id: ObjectId("62b896a5fd30b4e290b445c2"),
    superwarden: "ff",
    villagers: [
        ObjectId("62b89559fd30b4e290b425ae"),
        ObjectId("62b89546fd30b4e290b4259e"),
        ObjectId("62b89491fd30b4e290b4258f")
    ],
    details: {
        name: "vbfg",
        categories: [
            "Social"
        ],
        bio: "sfg",
        avatar: "https://randomuser.me/api/portraits/med/men/1.jpg",
        coverPhoto: "",
        slug: "",
        twitter: "",
        discord: "",
        github: "",
        forum: "",
        details: "",
        bannerPhoto: "",
        webThrKey: "",
        pinataKey: "",
        pinataSecret: "",
        private: false,
        master: "",
        warden: [
            "aa"
        ],
        "mtr_status": false,
        threshold: {
            status: false,
            "tk_symbol": "",
            "tk_addr": "",
            threshold: ""
        },
        tcr: {
            status: false,
            "tk_symbol": "",
            "tk_addr": ""
        }
    },
    "created_at": ISODate("2022-06-26T17:25:57.37Z"),
    "updated_at": ISODate("2022-06-26T17:25:57.37Z"),
    "deleted_at": null,
    __v: NumberInt("0")
} ]);
db.getCollection("townhalls").insert([ {
    _id: ObjectId("62b896a5fd30b2e290b425c2"),
    superwarden: "ff",
    villagers: [
        ObjectId("62b89559fd30b4e290b425ae"),
        ObjectId("62b89546fd30b4e290b4259e"),
        ObjectId("62b89491fd30b4e290b4258f")
    ],
    details: {
        name: "vbfg",
        categories: [
            "Social"
        ],
        bio: "sfg",
        avatar: "https://randomuser.me/api/portraits/med/men/1.jpg",
        coverPhoto: "",
        slug: "",
        twitter: "",
        discord: "",
        github: "",
        forum: "",
        details: "",
        bannerPhoto: "",
        webThrKey: "",
        pinataKey: "",
        pinataSecret: "",
        private: false,
        master: "",
        warden: [
            "aa"
        ],
        "mtr_status": false,
        threshold: {
            status: false,
            "tk_symbol": "",
            "tk_addr": "",
            threshold: ""
        },
        tcr: {
            status: false,
            "tk_symbol": "",
            "tk_addr": ""
        }
    },
    "created_at": ISODate("2022-06-26T17:25:57.37Z"),
    "updated_at": ISODate("2022-06-26T17:25:57.37Z"),
    "deleted_at": null,
    __v: NumberInt("0")
} ]);
