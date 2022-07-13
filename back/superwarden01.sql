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

 Date: 11/07/2022 22:11:56
*/


// ----------------------------
// Collection structure for accounts
// ----------------------------
db.getCollection("accounts").drop();
db.createCollection("accounts");

// ----------------------------
// Documents of accounts
// ----------------------------
db.getCollection("accounts").insert([ {
    _id: ObjectId("62bc338ed5a813b9567a044b"),
    address: "TVSPxScHmwoQP3TG4EkAGtbu6nrvmjTgMs",
    name: "Suuper project maker",
    bio: "Hi, this is a sample text for my bio and it is 120 character long. Thank you for your reading.",
    __v: NumberInt("0")
} ]);
db.getCollection("accounts").insert([ {
    _id: ObjectId("62bc5b2ba2e4d9d6e66fb05e"),
    address: "aa",
    name: "",
    bio: "",
    __v: NumberInt("0")
} ]);
db.getCollection("accounts").insert([ {
    _id: ObjectId("62bc8a8ad25532e649fd67c1"),
    address: "bb",
    name: "",
    bio: "",
    __v: NumberInt("0")
} ]);
db.getCollection("accounts").insert([ {
    _id: ObjectId("62bc8a9ad25532e649fd67c5"),
    address: "cc",
    name: "",
    bio: "",
    __v: NumberInt("0")
} ]);
db.getCollection("accounts").insert([ {
    _id: ObjectId("62bc8a9fd25532e649fd67c9"),
    address: "dd",
    name: "",
    bio: "",
    __v: NumberInt("0")
} ]);
db.getCollection("accounts").insert([ {
    _id: ObjectId("62bf27fa060faaa3aa77a1e3"),
    address: "ccefxxfhjyyui",
    name: null,
    bio: "",
    __v: NumberInt("0")
} ]);
db.getCollection("accounts").insert([ {
    _id: ObjectId("62c6f46c280a91aed7cf4d9a"),
    address: "bbvdfgvfd",
    name: null,
    bio: "",
    __v: NumberInt("0")
} ]);

// ----------------------------
// Collection structure for announces
// ----------------------------
db.getCollection("announces").drop();
db.createCollection("announces");

// ----------------------------
// Documents of announces
// ----------------------------
db.getCollection("announces").insert([ {
    _id: ObjectId("62c6f85cdac064a7b177d546"),
    slug: "superwarden.tron",
    creator: ObjectId("62bc338ed5a813b9567a044b"),
    cid: "bafybeicdskbibij77sr3xfzbo2vmlq44lbpfc3uy65cylfedi7hcytk6aq",
    title: "We are having an election this summer!",
    summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
    attachment: "asdf",
    "expire_at": ISODate("2022-07-06T07:00:00.000Z"),
    timezone: {
        offset: "-07:00",
        label: "(GMT-07:00) Mountain Time",
        tzCode: "America/Denver"
    },
    importance: true,
    __v: NumberInt("0")
} ]);
db.getCollection("announces").insert([ {
    _id: ObjectId("62c6f45cdac064a7b177d546"),
    slug: "superwarden.tron",
    creator: ObjectId("62bc338ed5a813b9567a044b"),
    cid: "bafybeicdskbibij77sr3xfzbo2vmlq44lbpfc3uy65cylfedi7hcytk6aq",
    title: "We arxzvvvvvvvv fgdsgfsde having an election this summer!",
    summary: "Lorem ipsum dob vsdfb dfg fd afadf ada fefeg  sdfaf lor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
    attachment: "asdf",
    "expire_at": ISODate("2022-07-16T07:00:00.000Z"),
    timezone: {
        offset: "-07:00",
        label: "(GMT-07:00) Mountain Time",
        tzCode: "America/Denver"
    },
    importance: false,
    __v: NumberInt("0")
} ]);

// ----------------------------
// Collection structure for proposals
// ----------------------------
db.getCollection("proposals").drop();
db.createCollection("proposals");

// ----------------------------
// Documents of proposals
// ----------------------------
db.getCollection("proposals").insert([ {
    _id: ObjectId("62ca71ff44b4bbf92cfc3d64"),
    slug: "superwarden.tron",
    creator: ObjectId("62bc338ed5a813b9567a044b"),
    type: NumberInt("1"),
    "ctr_addr": "TQQg4EL8o1BSeKJY4MJ8TB8XK7xufxFBvK",
    threshold: NumberInt("435"),
    multiplier: NumberInt("1"),
    percent: NumberInt("10"),
    title: "[SIP13] Superwarden Annual Community Election (Round 2)",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
    summary: "# Superwarden Part 2 Development\r\n\r\n## How to create a proposal\r\n### Step 1\r\n1. Title: title of the proposal\r\n\r\n2. Short Description: short description will be used to display on the proposal section's cards (let user to have a brief understanding before clicking into the proposal's individual page), please refer to `announcement` UI in Figma for the design of the proposal section and cards. The short description has a **60 Words MAX** word limit as it cannot be too long. \r\n\r\n3. Discussions: user need to paste links of this proposal discussion forum post or website where they discuss this proposal. This will be later shown in the proposal (refer to the `single-proposal-page` UI in Figma). The discussion links are clickable in the individual proposal page.\r\n\r\n4. Attachements: user can provide links to attachments or website they want their voters to view. This will be also later shown in the proposal (refer to the `single-proposal-page` UI in Figma). The attachment links are clickable in the individual proposal page.\r\n\r\n### Step 2\r\n1. Proposal summary: user will write their proposal's content here in markdown format. The markdown text editor is similar to github readme editor\r\n\r\n   * The edit tab will be where the user type their markdown\r\n   \r\n   * When the user switch to the preview mode, it will render the content exactly according to the styling in the individual proposal page (refer to the `single-proposal-page` UI in Figma)\r\n\r\n### Step 3\r\n1. User now need to choose a voting system: single choice voting, approval voting and two round voting.\r\n\r\n2. After user choose a voting system, the respective voting option section will show (refer to these 3 voting option section UI in Figma: `create-proposal-step3-singleChoiceVotingChosen`, `create-proposal-step3-approvalChoiceVotingChosen`, `create-proposal-step3-twoRoundVotingChosen`)\r\n\r\n3. When the voting option section shows, user can now type in the voting options for the proposal. They can also add more options by clicking the plus button, and also delete the options they wrote. However, please take note about the minimum option the user have to input according to the voting system they chose. You can refer to the \"Voting System\" section in this docs to read more about this.\r\n\r\n### Step 4\r\n1. User can choose a voting strategy. For more details of each voting strategy, please refer to the \"Voting Strategies\" section in this docs.\r\n\r\n### Step 5\r\n1. After user choose a voting strategy, we need to display the respective voting startegy settings form for them:\r\n\r\n   * For TRC-10, TRC-20, TRC-721 Balance strategy: settings will be `create-proposal-step5` UI in Figma\r\n   \r\n      * User can input a token symbol for the token. The token symbol will be used in the voting result and voters list. (refer to the `single-proposal-page` UI in Figma)\r\n\r\n      * User need to provide the token contract address which is use to vote.\r\n      * If user wanted to set a quorom threshold for the proposal voting, he/she can check this function. After checking the function, the field only will be enable for inputting. User will enter a percentage here, and maximum is 100%, hence we need to perform check whether user enter a percentage which is larger than 100 or a negative number, as these inputs are not allowed. We also need to expect user to enter a input with % symbol and without % symbol. Both inputs can correctly read into the database and perform calculation correctly in future use. For more details regarding quorum threshold, please read the \"Quorom Threshold\" section in this docs.\r\n\r\n   * For TRC-10, TRC-20, TRC-721 Balance /w Threhold strategy: settings will be `create-proposal-step5-threshold` UI in Figma\r\n      \r\n     * Token symbol and token contract address will be similar to the token balance strategy, but we will have an extra field:\r\n     \r\n     * User will need to input a minimum threshold, which means voters need to have a balance of token which is equal or greater than the threshold in order to eligible to submit a vote.\r\n\r\n      * The quorom threshold function is similar to the token balance strategy.\r\n\r\n    * For whitelist voting: settings will be `create-proposal-step5-whitelist` UI in Figma\r\n    \r\n      * Here, we do not use token symbol, as we are giving each whitelist addresses a ticket to vote. So, user can give the ticket a symbol name.\r\n\r\n      * User can download our whitelist.xlsx boilerplate file and input all the whitelist addresses inside. Next, user will upload the whitelist excel file here and this file will be use to read the whitelist addresses which is eligible to vote for the proposal.\r\n\r\n      * The quorom threshold function is similar to the token balance strategy.\r\n\r\n### Step 6\r\n1. Single Choice Voting and Approval Voting: date and time settings will be `create-proposal-step6` UI in Figma\r\n\r\n2. Two round voting: date and time settings will be `create-proposal-step6-tworound` UI in Figma\r\n\r\n3. User can choose their timezone for the proposal. For the complete timezones list, please refer to the `timezone` folder README file.\r\n\r\n4. User can choose the start date, start time, end date and end time. For two round voting, user then can choose the start and end date & time for both two round.\r\n\r\n5. User can check the shielded voting function. If check, the voting result and voters list will be shielded, and will only revealed when the voting had ended. For more details for shielded voting, please refer to the \"Shielded Voting\" section in this docs.\r\n\r\n### Step 7\r\n1. User need to check the confirmation box in order to click the submit button. Or else, the submit button will be remain in a disabled state.\r\n\r\n\r\n## Voting System\r\n\r\n### Single Choice Voting\r\nSingle choice voting required user to at least create two voting option for the proposal, so voters can choose one of them to submit their vote. Single choice voting is a one token one vote mechanism, which means the balance of token in the user wallet will be the votes he/her contribute to the voting. For example, with 1000 token A in his wallet, he will contribute 1000 votes to the option. \r\n\r\n* We will calculate the `total tokens` of each option and display in the result. For example, 1000 TOKEN has vote option A. Hence, option A has 1000 TOKEN.\r\n* We will calculate the `percentage of the tokens allocation` and display in the result. This percentage allocation means: From the total tokens which votes in the proposal, how many percentage of tokens vote for that option?\r\n\r\n  * **Formula**: (amount of tokens voted on that option/ total amount of tokens voted)*100%\r\n  \r\n  * For example, option A has 1000 token, option B has 1000 token. Hence, 1000 (option A)/2000 (total) * 100% = 50%. Option A has 50% allocation. Same applied to token B, which also has 50% allocation.\r\n  \r\n### Approval Voting\r\nApproval voting is a multiple choice voting mechanism, where user can choose more than one option or just choose one option. Hence, approval voting required user to at least create two voting option for the proposal. Similar to single choice voting, the balance of token in the user wallet will be the votes he/her can contribute to the voting. However, the different is, approval voting will equally spread the votes among the options vote by the user (if user choose multiple options when vote). For example, a proposal has three option (option A, B and C), user has 1000 tokens and chooses option A and B (vote for two option), he will contribute 500 votes for option A and 500 votes for option B during the calculation. \r\n\r\n* We will calculate the `total tokens` of each option and display in the result. For example, 1000 TOKEN has vote option A. Hence, option A has 1000 TOKEN.\r\n\r\n* **Formula**: (amount of tokens voted on that option/ total amount of tokens voted)*100%\r\n  \r\n  * For example, option A has 1000 token, option B has 1000 token. Hence, 1000 (option A)/2000 (total) * 100% = 50%. Option A has 50% allocation. Same applied to token B, which also has 50% allocation.\r\n  \r\n### Two-round Voting\r\nTwo round voting is actually a single choice voting, but with two round. For the first round, the top 2 candidates (two with the highest vote) will become the voting option of second round. Hence, we can say that, second round will always only have two candidates, which comes from first round. We also need to note that, two round voting required user to at least create three voting option, as we need to choose top 2 from the options (if only two option for two round voting, then it doesnt make sense).\r\n\r\n* Please note that, even user didnt participate in first round voting, he/she can still participate in the voting of second round. Hence, please take note on the calculation of the voting result, as total number of tokens voted might be different from first round. Refer to single choice voting result calculation.\r\n\r\n* In first round, the result of first round will be displayed, but the result of second round will only display `TBA` (to be announced) as we still do not know who is the top 2 to enter the second round until the first round ends.\r\n\r\n* In first round, the first round voters list will be displayed. But the second round voters list will be empty as second round haven't started yet.\r\n\r\n* In second round, the result of first round will be displayed too (but it is fixed, as round 1 had ended). The result of second round will now be displayed.\r\n\r\n* In second round, the voters list of first round (it is fixed, as round 1 had ended) and second round will be displayed.\r\n\r\n* Refer single choice voting for the calculation of voting result\r\n\r\n## Voting Strategies\r\n\r\n### TRC-10 Balance\r\n1. For single choice voting: \r\n   * Check whether the user's wallet have the TRC-10 token specified by the user (the token address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote\r\n   * The balance of the tokens (which the user have in the wallet) is the number of votes he/her submit (1 token 1 vote)\r\n   * For example: Jim has 1000 token A, he votes for option A and submit his vote. He contribute 1000 votes to option A.\r\n\r\n2. For approval voting (multiple choice voting):\r\n   * Check whether the user's wallet have the TRC-10 token specified by the user (the token address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote \r\n   * The balance of the tokens (which the user has in the wallet) will be the number of votes he/her submit. However, the number of votes will be equally divided among his/her option\r\n   * For example: Jim has 1000 token A, he votes for option A and B. Hence, he contribute 500 votes to option A and 500 votes to option B (votes had been divided into two in this case). If user choose only one option, the votes will all go to the one option. \r\n\r\n3. For two round voting:\r\n   * Similar to single choice voting, but we have two round.\r\n   * In first round, the balance of tokens in user wallet will be the number of votes by the user\r\n   * In second round, the balance of tokens in user wallet will also be the number of votes by the user\r\n   * For example: Jim has 1000 token A in first round, he votes for option A in first round. He contribute 1000 votes for option A in first round | In second round, option A and option B chosen as the top two option. Jim has 1000 token A in second round, he votes for option A in second round again. Hence, he contribute 1000 votes for option A in second round.\r\n\r\n### TRC-10 Balance /w Threshold\r\nAll the voting calculation is similar to the `TRC-10 Balance` startegy. However, user will provide a threshold for the voting. This threshold means the balance of that specified token in the user wallet need to be equal or greater than the threshold, in order to submit a vote. Hence, if user doesn't pass the threshold, user can't submit a vote (refer to vote-popup-ineligible UI in Figma); if user pass the threshold, user can submit his/her vote.\r\n\r\n### TRC-20 Balance \r\n1. For single choice voting: \r\n   * Check whether the user's wallet have the TRC-20 token specified by the user (the token address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote\r\n   * The balance of the tokens (which the user have in the wallet) is the number of votes he/her submit (1 token 1 vote)\r\n   * For example: Jim has 1000 token A, he votes for option A and submit his vote. He contribute 1000 votes to option A.\r\n\r\n2. For approval voting (multiple choice voting):\r\n   * Check whether the user's wallet have the TRC-20 token specified by the user (the token address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote \r\n   * The balance of the tokens (which the user has in the wallet) will be the number of votes he/her submit. However, the number of votes will be equally divided among his/her option\r\n   * For example: Jim has 1000 token A, he votes for option A and B. Hence, he contribute 500 votes to option A and 500 votes to option B (votes had been divided into two in this case). If user choose only one option, the votes will all go to the one option. \r\n\r\n3. For two round voting:\r\n   * Similar to single choice voting, but we have two round.\r\n   * In first round, the balance of tokens in user wallet will be the number of votes by the user\r\n   * In second round, the balance of tokens in user wallet will also be the number of votes by the user\r\n   * For example: Jim has 1000 token A in first round, he votes for option A in first round. He contribute 1000 votes for option A in first round | In second round, option A and option B chosen as the top two option. Jim has 1000 token A in second round, he votes for option A in second round again. Hence, he contribute 1000 votes for option A in second round.\r\n\r\n### TRC-20 Balance /w Threshold\r\nAll the voting calculation is similar to the `TRC-20 Balance` startegy. However, user will provide a threshold for the voting. This threshold means the balance of that specified token in the user wallet need to be equal or greater than the threshold, in order to submit a vote. Hence, if user doesn't pass the threshold, user can't submit a vote (refer to vote-popup-ineligible UI in Figma); if user pass the threshold, user can submit his/her vote.\r\n\r\n### TRC-721 Voting \r\n1. For single choice voting: \r\n   * Check whether the user's wallet have the TRC-721 token (NFT token) specified by the user (the collection address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote\r\n   * The number of NFTs or TRC-721 token (which the user have in the wallet) is the number of votes he/her submit (1 token 1 vote)\r\n   * For example: Jim has 3 rabbit NFTs, he votes for option A and submit his vote. He contribute 3 votes to option A.\r\n\r\n2. For approval voting (multiple choice voting):\r\n   * Check whether the user's wallet have the TRC-721 token (NFT token) specified by the user (the collection address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote \r\n   * The number of NFTs or TRC-721 token (which the user has in the wallet) will be the number of votes he/her submit. However, the number of votes will be equally divided among his/her option\r\n   * For example: Jim has 4 rabbit NFTs, he votes for option A and B. Hence, he contribute 2 votes to option A and 2 votes to option B (votes had been divided into two in this case). If user choose only one option, the votes will all go to the one option. \r\n\r\n3. For two round voting:\r\n   * Similar to single choice voting, but we have two round.\r\n   * In first round, the number of NFT or TRC-721 token in user wallet will be the number of votes by the user\r\n   * In second round, the number of NFT or TRC-721 token in user wallet will also be the number of votes by the user\r\n   * For example: Jim has 4 rabbit NFT in first round, he votes for option A in first round. He contribute 4 votes for option A in first round | In second round, option A and option B chosen as the top two option. Jim has 4 rabbit NFT in second round, he votes for option A in second round again. Hence, he contribute 4 votes for option A in second round.\r\n\r\n### TRC-721 Voting with Multiplier\r\nAll the voting calculation and process are the same as `TRC-721 Voting` and `TRC-721 Voting /w Threshold`. However, the number of NFTs or TRC-721 token need to multiply by the multiplier input by user, before calculate it into the result. For example, a proposal voting with 1000 as the multiplier is created. Jim has 4 rabbit NFTs and wants to vote option A. 4 * 1000 = 4000. Hence, Jim contribute 4000 votes to option A (not 4 votes).\r\n\r\n### Whitelist Voting\r\nWhitelist voting is a single-choice 1P1V (one person one vote) voting. Hence every user will have one \"ticket\" with custom symbol which means the vote. We need to first check if the user wallet address is in the whitelist excel file. If no, then user can't submit vote (refer to vote-popup-ineligible UI in Figma). If yes, user can submit a vote. For example, the proposal voting has a ticket named \"WARDEN\". Jim is in the whitelist, he can vote, he vote option A. He contribute 1 WARDEN to option A. As you can see, in whitelist voting, we do not need to read the token amount from the user wallet, as we only need to check is the user wallet address is on the whitelist.xlsx file. If yes, he/her can vote and was given 1 ticket to contribute to one option.\r\n\r\n## About shielded voting\r\n\r\nShielded voting actually means: hide the result (not displaying to the voters) and also hide the list of voters (not letting the user to know who has voted and also not knowing how many has voted). Only display it when the voting period had ended. For single choice voting and approval voting, unshield everything when voting period had ended. For two round voting, the first round voters list and voting result will be unshield when first round had ended, however, second round voter list and result should be remain shielded, and only unshield when second round voting had ended. \r\n\r\n## Quorum Threshold\r\n\r\nA quorum is the minimum votes (in our case, tokens) to participate in a proposal voting, in order for the proposal to be approved. If the quorum is set to 50%, it means that we need 50% of circulating tokens to vote yes for a proposal to pass. Please take note that the calculation looks at circulating supply and requires that 50% of all the tokens need to choose yes for the proposal to pass. Even if 50% of all tokens participate, if 1 token votes for no, that vote will not pass.\r\n\r\nFor example, token A has 1000 circulating tokens (votes). If the proposal has a 50% quorum, it means that we need 500 or more tokens for an option to pass. If let say only 499 token vote YES, even though YES has majority vote, it still won't pass as the quorum is not achieved. Same scenario for a NO option. \r\n\r\nHence, the quorum threshold will be show at the individual proposal page at the quorum div box (refer the `single-proposal-page` UI in Figma) and the votes required is the (circulating tokens amount * quorum threshold).\r\n\r\nWhen a proposal voting ended with a result which the quorum is not met. The result of this voting will be stated as (in the proposal section's proposal card- refer to `townhall` UI in Figma): \"N/A. Proposal do not meet the quorum threshold\". \r\n\r\n",
    timezone: {
        offset: "-09:00",
        label: "(GMT-09:00) Gambier",
        tzCode: "Pacific/Gambier"
    },
    "f_start_at": ISODate("2022-07-16T02:01:00.000Z"),
    "f_end_at": ISODate("2022-07-21T01:02:00.000Z"),
    discussions: [
        "Superwarden DAO Forum Post | [SIP13] Superwarden",
        "Superwarden DAO Forum Post | [SIP13] dafje d fjioe feio feoiwf jeiof jeiof  foeif eo fSuperwarden"
    ],
    attachments: [
        "1"
    ],
    options: [
        "John Monacco",
        "Jane Perrydo"
    ],
    strategy: "trc-20-th",
    "tk_symbol": "1",
    "quorum_status": true,
    "f_start_date_at": "2022-07-16T07:00:00.000Z",
    "f_start_time_at": {
        HH: "02",
        mm: "01"
    },
    totalToken: 1546,
    "f_end_date_at": "2022-07-21T07:00:00.000Z",
    "f_end_time_at": {
        HH: "01",
        mm: "02"
    },
    shield: true,
    cid: "bdjfehjkdfnehfegfge8932hjihjewio",
    "created_at": ISODate("2022-07-10T06:30:23.542Z"),
    __v: NumberInt("2"),
    status: 0,
    result: [
        { }
    ],
    voters: [ ]
} ]);
db.getCollection("proposals").insert([ {
    _id: ObjectId("62ca9a8fdfab7fcb9147a76e"),
    slug: "superwarden.tron",
    creator: ObjectId("62bc338ed5a813b9567a044b"),
    type: NumberInt("0"),
    "ctr_addr": "1",
    threshold: NumberInt("0"),
    multiplier: NumberInt("1"),
    percent: NumberInt("0"),
    title: "1",
    description: "1",
    summary: "1",
    timezone: {
        offset: "-10:00",
        label: "(GMT-10:00) Tahiti",
        tzCode: "Pacific/Tahiti"
    },
    "f_start_at": ISODate("2022-07-01T02:03:00.000Z"),
    "f_end_at": ISODate("2022-07-05T07:20:00.000Z"),
    discussions: [
        "1"
    ],
    status: NumberInt("2"),
    attachments: [
        "1"
    ],
    options: [
        "1",
        "1"
    ],
    strategy: "trc-20",
    "tk_symbol": "1",
    "f_start_date_at": "2022-07-01T07:00:00.000Z",
    "f_start_time_at": {
        HH: "02",
        mm: "03"
    },
    "f_end_date_at": "2022-07-14T07:00:00.000Z",
    "f_end_time_at": {
        HH: "07",
        mm: "20"
    },
    "created_at": ISODate("2022-07-10T09:23:27.299Z"),
    __v: NumberInt("1"),
    result: { },
    voters: [ ]
} ]);
db.getCollection("proposals").insert([ {
    _id: ObjectId("62cc78132b5690a8bcb29188"),
    slug: "superwarden.tron",
    creator: ObjectId("62bc338ed5a813b9567a044b"),
    type: NumberInt("1"),
    threshold: NumberInt("0"),
    multiplier: NumberInt("1"),
    percent: NumberInt("0"),
    title: "1",
    description: "1",
    summary: "1",
    timezone: {
        offset: "-07:00",
        label: "(GMT-07:00) Mountain Time - Arizona",
        tzCode: "America/Phoenix"
    },
    "f_start_at": ISODate("2022-07-07T03:02:00.000Z"),
    "f_end_at": ISODate("2022-07-15T01:02:00.000Z"),
    voters: [
        {
            _id: "62cc78132b5690a8bcb29188",
            option: "dd",
            _addr: "TVSPxScHmwoQP3TG4EkAGtbu6nrvmjTgMs",
            balance: NumberInt("1200")
        },
        {
            _id: "62cc78132b5690a8bcb29188",
            option: "aa",
            _addr: "TVSPxScHmwoQP3TG4EkAGtbu6nrvmjTgMs",
            balance: NumberInt("1200")
        },
        {
            _id: "62cc78132b5690a8bcb29188",
            option: "aa",
            _addr: "TVSPxScHmwoQP3TG4EkAGtbu6nrvmjTgMs",
            balance: NumberInt("1300")
        },
        {
            _id: "62cc78132b5690a8bcb29188",
            option: "dd",
            _addr: "TVSPxScHmwoQP3TG4EkAGtbu6nrvmjTgMs",
            balance: NumberInt("1200")
        }
    ],
    cid: "bafybeiehdjkohuqwaydvmfimd5hxvpu4sdri5ptn6pfvsvqckjqiigkgau",
    discussions: [
        ""
    ],
    attachments: [
        ""
    ],
    options: [
        "dd",
        "aa",
        "rr"
    ],
    strategy: "whitelist",
    whitelist: [
        "TVSPxScHmwoQP3TG4EkAGtbu6nrvmjTgMs",
        "aa",
        "bb",
        "cc",
        "dd",
        "ccefxxfhjyyui",
        "bbvdfgvfd"
    ],
    "tck_symbol": "1",
    "f_start_date_at": "2022-07-07T07:00:00.000Z",
    "f_start_time_at": {
        HH: "03",
        mm: "02"
    },
    "f_end_date_at": "2022-07-15T07:00:00.000Z",
    "f_end_time_at": {
        HH: "01",
        mm: "02"
    },
    "created_at": ISODate("2022-07-11T19:20:51.038Z"),
    __v: NumberInt("1"),
    status: NumberInt("1"),
    result: [
        { }
    ]
} ]);

// ----------------------------
// Collection structure for townhalls
// ----------------------------
db.getCollection("townhalls").drop();
db.createCollection("townhalls");

// ----------------------------
// Documents of townhalls
// ----------------------------
db.getCollection("townhalls").insert([ {
    _id: ObjectId("62bc568ca2e4d9d6e66fb04a"),
    superwarden: "TVSPxScHmwoQP3TG4EkAGtbu6nrvmjTgMs",
    villagers: [
        ObjectId("62bc338ed5a813b9567a044b"),
        ObjectId("62bc8a9ad25532e649fd67c5")
    ],
    details: {
        name: "Superwarden DAO",
        categories: [
            "Media",
            "Art and Culture"
        ],
        bio: "The first off-chain governance and voting tool for Tron-based DAOs. Changing the game of Web3.0. and update",
        avatar: "https://ipfs.io/images/go-ipfs-hex-logo.png",
        coverPhoto: "https://ipfs.io/images/social-card.png",
        slug: "superwarden.tron",
        twitter: "",
        discord: "",
        github: "",
        forum: "",
        details: "# Superwarden Part 2 Development\r\n\r\n## How to create a proposal\r\n### Step 1\r\n1. Title: title of the proposal\r\n\r\n2. Short Description: short description will be used to display on the proposal section's cards (let user to have a brief understanding before clicking into the proposal's individual page), please refer to `announcement` UI in Figma for the design of the proposal section and cards. The short description has a **60 Words MAX** word limit as it cannot be too long. \r\n\r\n3. Discussions: user need to paste links of this proposal discussion forum post or website where they discuss this proposal. This will be later shown in the proposal (refer to the `single-proposal-page` UI in Figma). The discussion links are clickable in the individual proposal page.\r\n\r\n4. Attachements: user can provide links to attachments or website they want their voters to view. This will be also later shown in the proposal (refer to the `single-proposal-page` UI in Figma). The attachment links are clickable in the individual proposal page.\r\n\r\n### Step 2\r\n1. Proposal summary: user will write their proposal's content here in markdown format. The markdown text editor is similar to github readme editor\r\n\r\n   * The edit tab will be where the user type their markdown\r\n   \r\n   * When the user switch to the preview mode, it will render the content exactly according to the styling in the individual proposal page (refer to the `single-proposal-page` UI in Figma)\r\n\r\n### Step 3\r\n1. User now need to choose a voting system: single choice voting, approval voting and two round voting.\r\n\r\n2. After user choose a voting system, the respective voting option section will show (refer to these 3 voting option section UI in Figma: `create-proposal-step3-singleChoiceVotingChosen`, `create-proposal-step3-approvalChoiceVotingChosen`, `create-proposal-step3-twoRoundVotingChosen`)\r\n\r\n3. When the voting option section shows, user can now type in the voting options for the proposal. They can also add more options by clicking the plus button, and also delete the options they wrote. However, please take note about the minimum option the user have to input according to the voting system they chose. You can refer to the \"Voting System\" section in this docs to read more about this.\r\n\r\n### Step 4\r\n1. User can choose a voting strategy. For more details of each voting strategy, please refer to the \"Voting Strategies\" section in this docs.\r\n\r\n### Step 5\r\n1. After user choose a voting strategy, we need to display the respective voting startegy settings form for them:\r\n\r\n   * For TRC-10, TRC-20, TRC-721 Balance strategy: settings will be `create-proposal-step5` UI in Figma\r\n   \r\n      * User can input a token symbol for the token. The token symbol will be used in the voting result and voters list. (refer to the `single-proposal-page` UI in Figma)\r\n\r\n      * User need to provide the token contract address which is use to vote.\r\n      * If user wanted to set a quorom threshold for the proposal voting, he/she can check this function. After checking the function, the field only will be enable for inputting. User will enter a percentage here, and maximum is 100%, hence we need to perform check whether user enter a percentage which is larger than 100 or a negative number, as these inputs are not allowed. We also need to expect user to enter a input with % symbol and without % symbol. Both inputs can correctly read into the database and perform calculation correctly in future use. For more details regarding quorum threshold, please read the \"Quorom Threshold\" section in this docs.\r\n\r\n   * For TRC-10, TRC-20, TRC-721 Balance /w Threhold strategy: settings will be `create-proposal-step5-threshold` UI in Figma\r\n      \r\n     * Token symbol and token contract address will be similar to the token balance strategy, but we will have an extra field:\r\n     \r\n     * User will need to input a minimum threshold, which means voters need to have a balance of token which is equal or greater than the threshold in order to eligible to submit a vote.\r\n\r\n      * The quorom threshold function is similar to the token balance strategy.\r\n\r\n    * For whitelist voting: settings will be `create-proposal-step5-whitelist` UI in Figma\r\n    \r\n      * Here, we do not use token symbol, as we are giving each whitelist addresses a ticket to vote. So, user can give the ticket a symbol name.\r\n\r\n      * User can download our whitelist.xlsx boilerplate file and input all the whitelist addresses inside. Next, user will upload the whitelist excel file here and this file will be use to read the whitelist addresses which is eligible to vote for the proposal.\r\n\r\n      * The quorom threshold function is similar to the token balance strategy.\r\n\r\n### Step 6\r\n1. Single Choice Voting and Approval Voting: date and time settings will be `create-proposal-step6` UI in Figma\r\n\r\n2. Two round voting: date and time settings will be `create-proposal-step6-tworound` UI in Figma\r\n\r\n3. User can choose their timezone for the proposal. For the complete timezones list, please refer to the `timezone` folder README file.\r\n\r\n4. User can choose the start date, start time, end date and end time. For two round voting, user then can choose the start and end date & time for both two round.\r\n\r\n5. User can check the shielded voting function. If check, the voting result and voters list will be shielded, and will only revealed when the voting had ended. For more details for shielded voting, please refer to the \"Shielded Voting\" section in this docs.\r\n\r\n### Step 7\r\n1. User need to check the confirmation box in order to click the submit button. Or else, the submit button will be remain in a disabled state.\r\n\r\n\r\n## Voting System\r\n\r\n### Single Choice Voting\r\nSingle choice voting required user to at least create two voting option for the proposal, so voters can choose one of them to submit their vote. Single choice voting is a one token one vote mechanism, which means the balance of token in the user wallet will be the votes he/her contribute to the voting. For example, with 1000 token A in his wallet, he will contribute 1000 votes to the option. \r\n\r\n* We will calculate the `total tokens` of each option and display in the result. For example, 1000 TOKEN has vote option A. Hence, option A has 1000 TOKEN.\r\n* We will calculate the `percentage of the tokens allocation` and display in the result. This percentage allocation means: From the total tokens which votes in the proposal, how many percentage of tokens vote for that option?\r\n\r\n  * **Formula**: (amount of tokens voted on that option/ total amount of tokens voted)*100%\r\n  \r\n  * For example, option A has 1000 token, option B has 1000 token. Hence, 1000 (option A)/2000 (total) * 100% = 50%. Option A has 50% allocation. Same applied to token B, which also has 50% allocation.\r\n  \r\n### Approval Voting\r\nApproval voting is a multiple choice voting mechanism, where user can choose more than one option or just choose one option. Hence, approval voting required user to at least create two voting option for the proposal. Similar to single choice voting, the balance of token in the user wallet will be the votes he/her can contribute to the voting. However, the different is, approval voting will equally spread the votes among the options vote by the user (if user choose multiple options when vote). For example, a proposal has three option (option A, B and C), user has 1000 tokens and chooses option A and B (vote for two option), he will contribute 500 votes for option A and 500 votes for option B during the calculation. \r\n\r\n* We will calculate the `total tokens` of each option and display in the result. For example, 1000 TOKEN has vote option A. Hence, option A has 1000 TOKEN.\r\n\r\n* **Formula**: (amount of tokens voted on that option/ total amount of tokens voted)*100%\r\n  \r\n  * For example, option A has 1000 token, option B has 1000 token. Hence, 1000 (option A)/2000 (total) * 100% = 50%. Option A has 50% allocation. Same applied to token B, which also has 50% allocation.\r\n  \r\n### Two-round Voting\r\nTwo round voting is actually a single choice voting, but with two round. For the first round, the top 2 candidates (two with the highest vote) will become the voting option of second round. Hence, we can say that, second round will always only have two candidates, which comes from first round. We also need to note that, two round voting required user to at least create three voting option, as we need to choose top 2 from the options (if only two option for two round voting, then it doesnt make sense).\r\n\r\n* Please note that, even user didnt participate in first round voting, he/she can still participate in the voting of second round. Hence, please take note on the calculation of the voting result, as total number of tokens voted might be different from first round. Refer to single choice voting result calculation.\r\n\r\n* In first round, the result of first round will be displayed, but the result of second round will only display `TBA` (to be announced) as we still do not know who is the top 2 to enter the second round until the first round ends.\r\n\r\n* In first round, the first round voters list will be displayed. But the second round voters list will be empty as second round haven't started yet.\r\n\r\n* In second round, the result of first round will be displayed too (but it is fixed, as round 1 had ended). The result of second round will now be displayed.\r\n\r\n* In second round, the voters list of first round (it is fixed, as round 1 had ended) and second round will be displayed.\r\n\r\n* Refer single choice voting for the calculation of voting result\r\n\r\n## Voting Strategies\r\n\r\n### TRC-10 Balance\r\n1. For single choice voting: \r\n   * Check whether the user's wallet have the TRC-10 token specified by the user (the token address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote\r\n   * The balance of the tokens (which the user have in the wallet) is the number of votes he/her submit (1 token 1 vote)\r\n   * For example: Jim has 1000 token A, he votes for option A and submit his vote. He contribute 1000 votes to option A.\r\n\r\n2. For approval voting (multiple choice voting):\r\n   * Check whether the user's wallet have the TRC-10 token specified by the user (the token address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote \r\n   * The balance of the tokens (which the user has in the wallet) will be the number of votes he/her submit. However, the number of votes will be equally divided among his/her option\r\n   * For example: Jim has 1000 token A, he votes for option A and B. Hence, he contribute 500 votes to option A and 500 votes to option B (votes had been divided into two in this case). If user choose only one option, the votes will all go to the one option. \r\n\r\n3. For two round voting:\r\n   * Similar to single choice voting, but we have two round.\r\n   * In first round, the balance of tokens in user wallet will be the number of votes by the user\r\n   * In second round, the balance of tokens in user wallet will also be the number of votes by the user\r\n   * For example: Jim has 1000 token A in first round, he votes for option A in first round. He contribute 1000 votes for option A in first round | In second round, option A and option B chosen as the top two option. Jim has 1000 token A in second round, he votes for option A in second round again. Hence, he contribute 1000 votes for option A in second round.\r\n\r\n### TRC-10 Balance /w Threshold\r\nAll the voting calculation is similar to the `TRC-10 Balance` startegy. However, user will provide a threshold for the voting. This threshold means the balance of that specified token in the user wallet need to be equal or greater than the threshold, in order to submit a vote. Hence, if user doesn't pass the threshold, user can't submit a vote (refer to vote-popup-ineligible UI in Figma); if user pass the threshold, user can submit his/her vote.\r\n\r\n### TRC-20 Balance \r\n1. For single choice voting: \r\n   * Check whether the user's wallet have the TRC-20 token specified by the user (the token address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote\r\n   * The balance of the tokens (which the user have in the wallet) is the number of votes he/her submit (1 token 1 vote)\r\n   * For example: Jim has 1000 token A, he votes for option A and submit his vote. He contribute 1000 votes to option A.\r\n\r\n2. For approval voting (multiple choice voting):\r\n   * Check whether the user's wallet have the TRC-20 token specified by the user (the token address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote \r\n   * The balance of the tokens (which the user has in the wallet) will be the number of votes he/her submit. However, the number of votes will be equally divided among his/her option\r\n   * For example: Jim has 1000 token A, he votes for option A and B. Hence, he contribute 500 votes to option A and 500 votes to option B (votes had been divided into two in this case). If user choose only one option, the votes will all go to the one option. \r\n\r\n3. For two round voting:\r\n   * Similar to single choice voting, but we have two round.\r\n   * In first round, the balance of tokens in user wallet will be the number of votes by the user\r\n   * In second round, the balance of tokens in user wallet will also be the number of votes by the user\r\n   * For example: Jim has 1000 token A in first round, he votes for option A in first round. He contribute 1000 votes for option A in first round | In second round, option A and option B chosen as the top two option. Jim has 1000 token A in second round, he votes for option A in second round again. Hence, he contribute 1000 votes for option A in second round.\r\n\r\n### TRC-20 Balance /w Threshold\r\nAll the voting calculation is similar to the `TRC-20 Balance` startegy. However, user will provide a threshold for the voting. This threshold means the balance of that specified token in the user wallet need to be equal or greater than the threshold, in order to submit a vote. Hence, if user doesn't pass the threshold, user can't submit a vote (refer to vote-popup-ineligible UI in Figma); if user pass the threshold, user can submit his/her vote.\r\n\r\n### TRC-721 Voting \r\n1. For single choice voting: \r\n   * Check whether the user's wallet have the TRC-721 token (NFT token) specified by the user (the collection address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote\r\n   * The number of NFTs or TRC-721 token (which the user have in the wallet) is the number of votes he/her submit (1 token 1 vote)\r\n   * For example: Jim has 3 rabbit NFTs, he votes for option A and submit his vote. He contribute 3 votes to option A.\r\n\r\n2. For approval voting (multiple choice voting):\r\n   * Check whether the user's wallet have the TRC-721 token (NFT token) specified by the user (the collection address input)\r\n   * If no, user can't submit a vote (refer to vote-popup-ineligible UI in Figma)\r\n   * If yes, user can submit his/her vote \r\n   * The number of NFTs or TRC-721 token (which the user has in the wallet) will be the number of votes he/her submit. However, the number of votes will be equally divided among his/her option\r\n   * For example: Jim has 4 rabbit NFTs, he votes for option A and B. Hence, he contribute 2 votes to option A and 2 votes to option B (votes had been divided into two in this case). If user choose only one option, the votes will all go to the one option. \r\n\r\n3. For two round voting:\r\n   * Similar to single choice voting, but we have two round.\r\n   * In first round, the number of NFT or TRC-721 token in user wallet will be the number of votes by the user\r\n   * In second round, the number of NFT or TRC-721 token in user wallet will also be the number of votes by the user\r\n   * For example: Jim has 4 rabbit NFT in first round, he votes for option A in first round. He contribute 4 votes for option A in first round | In second round, option A and option B chosen as the top two option. Jim has 4 rabbit NFT in second round, he votes for option A in second round again. Hence, he contribute 4 votes for option A in second round.\r\n\r\n### TRC-721 Voting with Multiplier\r\nAll the voting calculation and process are the same as `TRC-721 Voting` and `TRC-721 Voting /w Threshold`. However, the number of NFTs or TRC-721 token need to multiply by the multiplier input by user, before calculate it into the result. For example, a proposal voting with 1000 as the multiplier is created. Jim has 4 rabbit NFTs and wants to vote option A. 4 * 1000 = 4000. Hence, Jim contribute 4000 votes to option A (not 4 votes).\r\n\r\n### Whitelist Voting\r\nWhitelist voting is a single-choice 1P1V (one person one vote) voting. Hence every user will have one \"ticket\" with custom symbol which means the vote. We need to first check if the user wallet address is in the whitelist excel file. If no, then user can't submit vote (refer to vote-popup-ineligible UI in Figma). If yes, user can submit a vote. For example, the proposal voting has a ticket named \"WARDEN\". Jim is in the whitelist, he can vote, he vote option A. He contribute 1 WARDEN to option A. As you can see, in whitelist voting, we do not need to read the token amount from the user wallet, as we only need to check is the user wallet address is on the whitelist.xlsx file. If yes, he/her can vote and was given 1 ticket to contribute to one option.\r\n\r\n## About shielded voting\r\n\r\nShielded voting actually means: hide the result (not displaying to the voters) and also hide the list of voters (not letting the user to know who has voted and also not knowing how many has voted). Only display it when the voting period had ended. For single choice voting and approval voting, unshield everything when voting period had ended. For two round voting, the first round voters list and voting result will be unshield when first round had ended, however, second round voter list and result should be remain shielded, and only unshield when second round voting had ended. \r\n\r\n## Quorum Threshold\r\n\r\nA quorum is the minimum votes (in our case, tokens) to participate in a proposal voting, in order for the proposal to be approved. If the quorum is set to 50%, it means that we need 50% of circulating tokens to vote yes for a proposal to pass. Please take note that the calculation looks at circulating supply and requires that 50% of all the tokens need to choose yes for the proposal to pass. Even if 50% of all tokens participate, if 1 token votes for no, that vote will not pass.\r\n\r\nFor example, token A has 1000 circulating tokens (votes). If the proposal has a 50% quorum, it means that we need 500 or more tokens for an option to pass. If let say only 499 token vote YES, even though YES has majority vote, it still won't pass as the quorum is not achieved. Same scenario for a NO option. \r\n\r\nHence, the quorum threshold will be show at the individual proposal page at the quorum div box (refer the `single-proposal-page` UI in Figma) and the votes required is the (circulating tokens amount * quorum threshold).\r\n\r\nWhen a proposal voting ended with a result which the quorum is not met. The result of this voting will be stated as (in the proposal section's proposal card- refer to `townhall` UI in Figma): \"N/A. Proposal do not meet the quorum threshold\". \r\n\r\n",
        bannerPhoto: "https://ipfs.io/images/meet-builders-thumbnail-pinata.png",
        webThrKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDFDQjM0M0I2M2IzMmY4OTYyOWY0MjA2NkRCYkM5NWFFMkI3NUY4ZDIiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NTY4NzAzNTU1NTQsIm5hbWUiOiJmaXJzdFdlYjMuc3RvcmFnZUtleSJ9.O1Q1-oFoJimEa5vb9nfUbS0sPZ5NmOowdkDqKw34PS0",
        pinataKey: "",
        pinataSecret: "",
        private: false,
        master: "aa, bb\ncc,\nff",
        warden: "",
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
    "created_at": ISODate("2022-06-29T13:41:32.334Z"),
    "updated_at": ISODate("2022-07-08T02:22:07.921Z"),
    "deleted_at": null,
    __v: NumberInt("0")
} ]);
db.getCollection("townhalls").insert([ {
    _id: ObjectId("62bc548ca2e4d9d6e66fb04a"),
    superwarden: "aa",
    villagers: [
        ObjectId("62bc5b2ba2e4d9d6e66fb05e")
    ],
    details: {
        name: "Superwarden u8y b7y78 by78y 78 y78DAO",
        categories: [
            "Media",
            "Art and Culture"
        ],
        bio: "The first off-chain governance and voting tool for Tron-based DAOs. Changing the game of Web3.0",
        avatar: "https://ipfs.io/images/go-ipfs-hex-logo.png",
        coverPhoto: "https://ipfs.io/images/social-card.png",
        slug: "tessuperwarden.tron",
        twitter: "",
        discord: "",
        github: "",
        forum: "",
        details: "",
        bannerPhoto: "",
        webThrKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDFDQjM0M0I2M2IzMmY4OTYyOWY0MjA2NkRCYkM5NWFFMkI3NUY4ZDIiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NTY4NzAzNTU1NTQsIm5hbWUiOiJmaXJzdFdlYjMuc3RvcmFnZUtleSJ9.O1Q1-oFoJimEa5vb9nfUbS0sPZ5NmOowdkDqKw34PS0",
        pinataKey: "",
        pinataSecret: "",
        private: false,
        master: "",
        warden: "",
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
    "created_at": ISODate("2022-06-29T13:41:32.334Z"),
    "updated_at": ISODate("2022-07-03T07:41:25.004Z"),
    "deleted_at": null,
    __v: NumberInt("0")
} ]);

// ----------------------------
// Collection structure for users
// ----------------------------
db.getCollection("users").drop();
db.createCollection("users");

// ----------------------------
// Documents of users
// ----------------------------
