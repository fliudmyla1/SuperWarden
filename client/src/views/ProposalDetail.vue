<template>
    <div class="ms-5 ps-3 py-5 mb-5">
        <div class="row" style= "width: 100%;">
            <div class="col-md-7">
                <button type=" " class="btn btn-default  p-0" @click="backToProposalList"><b>&#8592; Back</b></button>
                <button type=" " class="btn btn-default p-0 float-end" @click="deleteModal = true"><img src="../assets/delete-icon.png" style="height: 22px;"/></button>
                <div class="px-4 mt-5">
                    <div class="block-container-announcement-detail">
                        <div class="header mt-3">
                            <span class="fw-bolder text-dark fs-2">{{proposal.title}}</span>
                        </div>
                        <span class="fw-bolder mt-2">Broadcast by {{proposal.creator.name ? proposal.creator.name +"." + proposal.slug: proposal.creator.address }}
                            <span   v-if="proposal.status == 1" class="status-active ms-2">Active</span>
                            <span v-else-if = "proposal.status == 0" class="status-complete ms-2">Expecting</span>
                            <span v-else class="status-complete ms-2">Complete</span>

                        </span>
                        <!-- <span class="valid-till fw-bolder mt-2"><img src="../assets/clock-icon.png" class="pb-1 me-2" style="height: 25px;"/>Valid Till &nbsp;<img src="../assets/line1.png" style="height: 20px;"/> {{getDateString(announce.expire_at)}} ({{'UTC ' + announce.timezone.offset}})</span> -->
                    </div>
                    <div v-html="markdownToHtml" class="mt-4"
                        :class="{'show-less': !showMore} "></div>
                    <div class="text-center">
                        <button @click="showMore = !showMore" class="py-1 px-3 text-center fw-bolder my-4" style="border: 1px solid #959595; color:#959595;  background-color: #fff; border-radius: 7px;">
                        <span v-if = "showMore">Show less...</span>
                        <span v-else>Show more...</span>
                        </button>
                    </div>
                    <div class="my-2">
                        <p class="fs-5 fw-bolder text-dark">Discussions</p>
                        <div class="file-details mb-2" v-for="(i) in proposal.discussions">
                            <span class="fw-bolder">{{trimmedDiscussionTitle(i)}}</span>
                        </div>
                    </div>
                    <div class="mt-4">
                        <p class="fs-5 fw-bolder text-dark">Attachments</p>
                        <p v-for = "(p) in proposal.attachments" ><img src="../assets/file-icon.png" style="height: 24px;"/><a :href="`https://${p}`" class="ms-2 text-dark" style = "text-decoration: none;">{{p}}</a></p>
                    </div>
                    <div class="mt-4">
                        <p class="fs-5 fw-bolder text-dark">Voting Option</p>
                        <div class="file-details mb-2" v-for="(i, index) in proposal.options">
                            <span class="fw-bolder">Candidate {{index+1}} - {{i}}</span>

                            <!-- <span class="fw-bolder">{{trimmedDiscussionTitle(i)}}</span> -->
                        </div>
                    </div>
                    <div class="mt-4">
                        <p class="fs-5 fw-bolder text-dark">Voters</p>
                        
                        <div style="border-radius: 7px; border: 1px solid #959595">
  
                            <div v-if ="proposal.shield" class="text-center py-2" style=" border-bottom: 1px solid #D5D5D5;">
                                <img src = "../assets/voter-security.png" style="height: 200px;"/>
                            </div>
                            <div v-else v-for = "(v) in voters" class="ps-4 fw-bolder voter-container">
                                <img src="../assets/logo-icon.png" style="height: 20px; border-radius: 50%"/>
                                <p class="mt-3 ps-2">{{trimmedVotersAddress(v._addr)}}</p>
                                <p class="mt-3 ps-5">{{v.option}}</p>
                                <p class="mt-3 me-2" style="margin-left: auto;">{{trimmedBalance(v.balance)}} {{v.symbol}}</p>
                            </div>
                            <div @click="voterViewHandler" class="text-center voter-count-handler"><span v-if = "viewVoterMore" style="color: #959595;">View less</span>
                                <span v-else style="color: #959595;">View more</span></div>
                        </div>
                    </div>

                    <!-- <p>404 error</p> -->
                </div>
            </div>
            <div class="col-md-5 pt-5 pe-5" >
                <div class="mt-5  pt-2" style=" border: 1px solid #595959; margin-right: 100px; border-radius: 7px;">
                    <p class="fw-bolder ps-3 pb-2 mt-2" style="border-bottom: 1px solid #d5d5d5;">Proposal Voting Info</p>
                    <p class="fw-bolder ps-3 mt-4">Voting System: 
                        <span v-if = "proposal.type == 0"  style= "color: #959595">Single Choice Voting</span>
                        <span v-if = "proposal.type == 1" style= "color: #959595">Approval Voting</span>
                        <span v-if = "proposal.type == 2" style= "color: #959595">Two Round Voting</span>
                    </p>

                                       
                    <p class="fw-bolder ps-3 mt-2">Voting Strategy: 
                        <span v-if="proposal.strategy == 'trc-10'" style= "color: #959595">TRC-10 Balance</span>
                        <span v-if="proposal.strategy == 'trc-20'" style= "color: #959595">TRC-20 Balance</span>
                        <span v-if="proposal.strategy == 'trc-721'" style= "color: #959595">TRC-721 Voting</span>
                        <span v-if="proposal.strategy == 'whitelist'" style= "color: #959595">Whitelist Voting</span>
                        <span v-if="proposal.strategy == 'trc-10-th'" style= "color: #959595">TRC-10 Balance /w Threshold</span>
                        <span v-if="proposal.strategy == 'trc-20-th'" style= "color: #959595; ">TRC-20 Balance /w Threshold</span>
                        <span v-if="proposal.strategy == 'trc-721-multi'" style= "color: #959595">TRC-721 Voting /w Multiplier</span>
                    </p>
                    <p class="fw-bolder ps-3 mt-2">Threshold: 
                        <span v-if="proposal.threshold == 0" style= "color: #959595">N/A</span>
                        <span v-else style= "color: #959595">{{proposal.threshold}}</span>
                    </p>
                    <p class="fw-bolder ps-3 mt-2">Multiplier: 
                        <span v-if="proposal.multiplier == 1" style= "color: #959595">N/A</span>
                        <span v-else style= "color: #959595">{{proposal.multiplier}}</span>
                    </p>
                    <p class="fw-bolder ps-3 mt-2">Proposal CID: 
                        <span style= "color: #959595">{{trimmedProposalCid(proposal.cid)}}</span>
                        <span><img src = "../assets/coppy-icon.png" style="height:22px"></span>
                    </p>
                    <p class="fw-bolder ps-3 mt-2">Voting Result CID: 
                        <span v-if="proposal.votedCid">
                            <span style= "color: #959595">{{trimmedProposalCid(proposal.votedCid)}}</span>
                            <span><img src = "../assets/coppy-icon.png" style="height:22px"></span>
                        </span>
                        <span v-else style= "color: #959595">N/A</span>

                    </p>
                    <p class="fw-bolder ps-3 mt-2">Start: 
                        <span style="color: #959595;">{{getDateAndTimeString(proposal.f_start_at)}}</span>
                    </p>
                    <p class="fw-bolder ps-3 mt-2">End: 
                        <span style="color: #959595;">{{getDateAndTimeString(proposal.f_end_at)}}</span>
                    </p>
                    <p class="fw-bolder ps-3 mt-2">Timezone: 
                        <span style="color: #959595;">{{`UTC ${parseInt(proposal.timezone.offset)}`}}</span>
                    </p>
                    <p class="fw-bolder ps-3 mt-2">Duration: 
                        <span v-if = "round == 1" style="color: #959595;">{{getTimeDifference(proposal.f_start_at, proposal.f_end_at)}}</span>
                        <span v-else style="color: #959595;">{{getTimeDifference(proposal.s_start_at, proposal.s_end_at)}}</span>
                    </p>
                </div>
                <div class="mt-5  pt-2" style=" border: 1px solid #595959; margin-right: 100px; border-radius: 7px;">
                    <p class="fw-bolder ps-3 pb-2 mt-2" style="border-bottom: 1px solid #d5d5d5;">Quorum</p>
                    <p class="fw-bolder ps-3 mt-4">Threshold: 
                        <span v-if="proposal.percent == 0" style= "color: #959595">N/A</span>
                        <span v-else style= "color: #959595">{{proposal.percent}}%</span>
                    </p>
                    <p class="fw-bolder ps-3 mt-2">Votes required: 
                        <span v-if="proposal.percent == 0" style= "color: #959595">N/A</span>
                        <span v-else style= "color: #959595">{{parseInt(proposal.totalToken * proposal.percent / 100) / 100 + "K " + proposal.tk_symbol}}</span>
                    </p>
                </div>
                <div v-if ="proposal.type != 2" class="mt-5  pt-2" style=" border: 1px solid #595959; margin-right: 100px; border-radius: 7px;">
                    <p class="fw-bolder ps-3 pb-3 mt-2" style="border-bottom: 1px solid #d5d5d5;">Voting Result</p>
                    <div v-if = "proposal.shield" class="text-center">
                        <img  src="../assets/security.png" style="width: 185px"/>
                    </div>
                    <div v-else class = "py-2">
                        <div v-for ="(r, i) in proposal.result">
                            <p class="fw-bolder ps-3" style="font-size: 14px;">Candidate - {{i+1}} {{trimmedVotingOption(r.option)}}
                            <span class="float-end me-4">{{r.amount / 1000}}K {{r.symbol}} {{getProgressWidth(r)}}</span>
                            </p>
                            <div class="px-3 mb-4">
                                <div class="progress ">
                                    <div class="progress-bar bg-danger" role="progressbar" :style="`width : ${getProgressWidth(r)}`" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center my-4 py-2" v-if = "proposal.status == 1">
                        <button v-if ="voted" class="btn btn-danger text-center" disabled style="width: 80%;">Already voted</button>
                        <button v-else @click = "viewVoteNowModal" class="btn btn-danger text-center" style="width: 80%;">Vote Now</button>
                    </div>
                </div>
                <div v-else>
                    <div class="mt-5  pt-2" style=" border: 1px solid #595959; margin-right: 100px; border-radius: 7px;">
                        <p class="fw-bolder ps-3 pb-3 mt-2" style="border-bottom: 1px solid #d5d5d5;">Round 1 Voting Result</p>
                        <div v-if = "proposal.shield" class="text-center">
                            <img  src="../assets/security.png" style="width: 185px"/>
                        </div>
                        <div v-else class = "py-2">
                            <div v-for ="(r, i) in proposal.result">
                                <p class="fw-bolder ps-3 mt-4" style="font-size: 14px;">Candidate - {{i+1}} {{trimmedVotingOption(r.option)}}
                                <span class="float-end me-4">{{r.amount / 1000}}K {{r.symbol}} {{getProgressWidth(r)}}</span>
                                </p>
                                <div class="px-3">
                                    <div class="progress ">
                                        <div class="progress-bar bg-danger" role="progressbar" :style="`width : ${getProgressWidth(r)}`" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center my-4 py-2" v-if = "proposal.status == 1">
                            <button v-if ="voted" class="btn btn-danger text-center" disabled style="width: 80%;">Already voted</button>
                            <button v-else @click = "viewVoteNowModal" class="btn btn-danger text-center" style="width: 80%;">Vote Now</button>
                        </div>
                    </div>
                    <div class="mt-4  pt-2" style=" border: 1px solid #595959; margin-right: 100px; border-radius: 7px;">
                        <p class="fw-bolder ps-3 pb-3 mt-2" style="border-bottom: 1px solid #d5d5d5;">Round 2 Voting Result</p>
                        <div v-if ="round ==1" class="text-center fw-bolder" style="min-height: 50px;"></div>
                        <div v-else>
                            <div v-if = "proposal.shield" class="text-center">
                                <img  src="../assets/security.png" style="width: 185px"/>
                            </div>
                            <div v-else class = "py-2">
                                <div v-for ="(r, i) in proposal.s_result">
                                    <p class="fw-bolder ps-3 mt-4" style="font-size: 14px;">Candidate - {{i+1}} {{trimmedVotingOption(r.option)}}
                                    <span class="float-end me-4">{{r.amount / 1000}}K {{r.symbol}} {{getProgressWidth(r)}}</span>
                                    </p>
                                    <div class="px-3">
                                        <div class="progress ">
                                            <div class="progress-bar bg-danger" role="progressbar" :style="`width : ${getProgressWidth(r)}`" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center my-4 py-2" v-if = "proposal.status == 1">
                                <button v-if ="voted" class="btn btn-danger text-center" disabled style="width: 80%;">Already voted</button>
                                <button v-else @click = "viewVoteNowModal" class="btn btn-danger text-center" style="width: 80%;">Vote Now</button>
                            </div>
                        </div>
                    </div>


                </div>







            </div>
        </div>
    </div>
    
<!-- Modal Region -->
  <Modal v-model="voteNowModal" :close="closeModal" style="z-index: 9999;">
    <div class="modal-dialog" style="min-width: 600px;">
        <div class="modal-content">
            <div @click="closeModal">
                <button style="right: 15px; position: absolute;" type="button" class="close border-0 mt-2 fs-4" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-5 px-5 py-4">
                <p class="modal-title mt-4 text-center text-dark fw-bolder" style="font-size: 25px;">Select your voting option</p>
                <form   v-on:submit.prevent="validateVoteNow" class="my-3 p-2 text-center">
                    <div v-bind:class="{'superwarden-invalid': validation.invalid.voteOptions }">
                        
                        <div @click="setOption(i)"  v-for="(i, index) in proposal.options"
                            :class = "voteOptions.includes(i)? 'selected': ''"
                            class="file-details-modal my-3 mx-1">
                            <span class="fw-bolder">Candidate {{index+1}} - {{i}}</span>
                        </div>
                    </div>
                   
                    <div v-if="validation.invalid.voteOptions" class="invalid-feedback text-center " style="display: block;">{{ validation.invalid.voteOptions }}</div>
                    <div class="mt-4" >
                        <div v-if = "votable">
                            <img src="../assets/vote-able.png" style="width:80% "/>
                            <button class="btn btn-danger mt-5" style="width:80% " type="submit">Submit Vote</button>
                        </div>
                        <div v-else>
                            <img src="../assets/vote-unable.png" style="width:80% "/>
                            <button class="btn btn-danger mt-5" disabled style="width:80% ">Submit Vote</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  </Modal>
  <Modal v-model="deleteModal" :close="closeDeleteModal" style="z-index: 9999;">
    <div class="modal-dialog" style="min-width: 600px;">
        <div class="modal-content">
            <div @click="closeDeleteModal">
                <button style="right: 15px; position: absolute;" type="button" class="close border-0 mt-2 fs-4" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-5 px-3 py-4">
                <p class="modal-title mt-4 text-center text-dark fw-bolder" style="font-size: 25px;"><span style="color: #dc062b;">Danger!</span> Are you really sure?</p>
                <p class = "mt-3">The deletion action <span class="fw-bolder">CANNOT</span> be undone. This will remove the proposal from the townhall and no longer able to view or even vote it. If your proposal is in an active voting status, deletion may also cause the voting records and result fail to store in the IPFS storage tools. Only delete proposals that are wrongly created or confirm to be deleted.  </p>
                <form   v-on:submit.prevent="validateDeleteModal" class="my-3 p-2 text-center">
                    <div class="mb-4 mt-2">
                    <label for="title" class="form-label fs-6">Please type in “confirm” to confirm your deletion.</label>
                    <input  v-model = "deleteConfirm"
                            v-bind:class="{ 'is-valid': validation.valid.deleteConfirm, 'is-invalid': validation.invalid.deleteConfirm }" 
                            v-on:focus="clearValidation('deleteConfirm')" 
                            type="text" id="title" class="form-control" autocomplete="false">
                    <div class="valid-feedback" v-if="validation.valid.deleteConfirm">{{ validation.valid.deleteConfirm }}</div>
                    <div class="invalid-feedback" v-if="validation.invalid.deleteConfirm">{{ validation.invalid.deleteConfirm }}</div>
                </div>
                            <button class="btn btn-danger mt-5"  type="submit">I understand the consequences. Delete this proposal.</button>
                </form>
            </div>
        </div>
    </div>
  </Modal>
<!-- Modal Region -->





</template>
<script>

// import api from './api'
import moment from 'moment';
import { marked } from 'marked';


export default {
    name: "ProposalDetail",
    data() {
        return {
            idx: this.$route.params['id'],

            round: 1,

            voters: [],
            totalVoters: [],

            result : [],
            totalVotes: 0,






            showMore: false,
            proposal: {
                creator: {},
                cid:'',
                votedCid: '',
                f_start_at: '',
                f_end_at: '',
                timezone: {},
                discussions: ['']
            },
            voteNowModal: false,
            votable: false,
            voteOptions:[],
            validation: { 
                invalid: {},
                valid: {},},

            viewVoterMore: false,
            voted: false,
            deleteConfirm: '',
            deleteModal: false,


            // active: {status : false}

        }
    },
computed: {
        markdownToHtml(){
            if (this.proposal.summary){
                return marked.parse(this.proposal.summary.toString())  ;
            }
        }
    },

    created() {
        this.getProposalData()


    },
    mounted() {
        
    },
    methods: {
        trimmedVotingOption(option){
            if (option.length > 5)
                return option.slice(0, 5) + "..."
            else
                return option
        },
        trimmedBalance(balance){
            return (balance / 1000).toString() + "K"
        },
        trimmedVotersAddress(_addr){
            return _addr.slice(0, 7) + "..."
        },

        trimmedProposalCid(cid){
            if (cid.length > 10)
                return cid.slice(0, 8) + "..."
            else
                return cid
        },
        trimmedAccountNameAndLowercase(name){
          let string = name.replace(/[, ]+/g, "").trim().toLowerCase();
            if (string.length > 12)
                return string.slice(0, 9) + "..." + string.slice(string.length - 4, string.length)
            else
                return string
        },
        trimmedAnnounceTitle(title){
          if (title.length > 38)
              return title.slice(0, 40) + "..." 
            else
              return title
        },
        trimmedAnnounceSummary(summary){
          // console.log(summary.length)
          if (summary.length > 334)
              return summary.slice(0, 334) + "..." 
            else
              return summary
        },
        trimmedDiscussionTitle(title){
          if (title.length > 75)
              return title.slice(0, 75) + "..." 
            else
              return title
        },
        getProgressWidth(r){
            let total = 0
            if (this.round =1){
                this.proposal.result.map(i => {
                    total += i.amount
                })
            } else {
                this.proposal.s_result.map(i => {
                    total += i.amount
                })
            }
            return parseInt((r.amount / total)* 100) + '%'
        },

        closeDeleteModal(){ this.deleteModal = false
            this.deleteConfirm = ''
            this.clearValidation('deleteConfirm')
        },
        closeModal() {this.voteNowModal = false; 
        this.voteOptions = [] 
        this.clearValidation('voteOptions')},
        validateDeleteModal(){
            if (this.deleteConfirm != "confirm"){
                this.validation.invalid.deleteConfirm = 'Please fill out this input correctly.';
                return
            }
            api.deleteProposal({_id:this.proposal._id}, (res => {
                if (res){
                    this.deleteModal = false
                    this.$toast.success('You deleted the proposal.')
                    this.backToProposalList()
                }
                    
                }), err =>{
                    console.log(err)
                })
                
        },
        voterViewHandler(){
            if (this.proposal.shield)
                return
            this.viewVoterMore = !this.viewVoterMore
            if (this.viewVoterMore)
                this.voters = this.totalVoters
            else
                this.voters = this.totalVoters.slice(0, 7)

        },
        clearValidation: function(field) {
            this.validation.valid[field] = '';
            this.validation.invalid[field] = '';
        },
        
        getDateAndTimeString(string){
          const monthNames = ["January", "February", "March", "April", "May", "June",
              "July", "August", "September", "October", "November", "December"];
            let year = string.slice(0, 4)
            let month = string.slice(5,7)
            month = monthNames[parseInt(month)-1]
            let day = string.slice(8, 10)
            let hour =  string.slice(11, 13)
            let tag = "AM"
            if (parseInt(hour) > 12){
                let a = parseInt(hour) - 12
                if (a > 10)
                    hour = a.toString()
                else
                    hour = "0" + a.string
                tag = "PM"
            }
            let minute = string.slice(14, 16)
            return `${day} ${month}, ${year}, ${hour}.${minute} ${tag}`;
        },
        getTimeDifference(s, e){
            let start = new Date(s)
            let end = new Date(e)
            let DurationTimeValue = end.getTime()-start.getTime()
            let day = parseInt(DurationTimeValue/(1000 * 3600 * 24))
            let hour = parseInt((DurationTimeValue - day * 1000 * 3600 * 24)/(1000 * 3600))
            let minute = parseInt((DurationTimeValue - day * 1000 * 3600 * 24 - hour * 1000 * 3600)/(1000 * 60)) 
            return `${day} days ${hour} hours ${minute} minutes`

        },

        backToProposalList(){this.$router.push(`/${this.proposal.slug}/proposal`)},

        
        async viewVoteNowModal(){
            const CONTRACT = "TKWsxjh97sCPipTAfghW7vDFdx2HhjecCe";

            // const contract = await tronWeb.contract().at(this.proposal.ctr_addr)
            const contract = await tronWeb.contract().at(CONTRACT)
            const my_balance = await contract.methods.balanceOf(window.tronWeb.defaultAddress.base58).call();
            let balance = parseInt(my_balance.toString())
            balance = 1200
            console.log('Client wallet balance: ' + balance)
            console.log('DB: the threshold of proposal')
            console.log(this.proposal.threshold)
            this.balance = balance
            if (balance > this.proposal.threshold)
                this.votable = true
            else
                this.votable = false
            this.voteNowModal = true
        },

        setOption(i){
            if (this.proposal.type == 1){
                if (this.voteOptions.includes(i))
                    this.voteOptions = this.voteOptions.filter(o => o != i);
                else
                    this.voteOptions.push(i)
            } else {
                this.voteOptions = []
                this.voteOptions.push(i)

            }
            this.clearValidation('voteOptions')

        },
        validateVoteNow(){

            if(this.voteOptions.length > 0){
                this.validation.valid.voteOptions = 'The voteOption is added.';
            }else {
                this.validation.invalid.voteOptions = 'Please select your vote option.';
                return
            }
            let data = []
            this.voteOptions.map((v)=>{
                let obj = {}
                obj.symbol = this.proposal.tk_symbol
                obj.option = v
                obj._addr = this.$store.getters._addr
                obj.balance = parseInt(this.balance / this.voteOptions.length)
                data.push(obj)
            })
            
            api.sendVote({_id:this.proposal._id,  data: data}, (res => {
                if (res.data.updated){
                    this.$toast.success('You successfully voted')
                    this.voteNowModal = false
                    this.getProposalData()
                }
            }), err =>{
                console.log(err)
            })
        },
        getProposalData(){
            api.getProposalData({_id: this.idx}, (res => {
                this.proposal = res.data.proposal
                if (this.proposal.s_start_at)
                    this.round = 2
                else
                    this.round = 1
                if (this.proposal.whitelist){
                    if (!this.proposal.whitelist.includes(this.$store.getters._addr))
                        this.voted = true
                } else {
                    if (this.round == 1){
                        this.totalVoters = res.data.proposal.voters
                        this.proposal.voters.map((v) => {
                            if (v._addr == this.$store.getters._addr){
                                this.voted = true
                            }
                        })
                    } else {
                        this.totalVoters = res.data.proposal.s_voters
                        this.proposal.s_voters.map((v) => {
                            if (v._addr == this.$store.getters._addr){
                                this.voted = true
                            }
                        })
                    }
                }
                this.viewVoterMore = false
                this.voters = this.totalVoters.slice(0, 7)
            }), err =>{
                console.log(err)
            })

        }
    }
}
</script>
<style>
.block-container-announcement-detail {
  display: flex;
  flex-direction: column;
  row-gap: 20px;
}

.block-container-announcement-detail .header {
  display: flex;
  justify-content: space-between;
}

.block-container-announcement-detail .header .status {
  border-radius: 20px;
  height: 25px;
  padding: 2px 15px;
  color: white;
  font-weight: Bold;
  font-size: 15px;
}
.status-active {
  border-radius: 20px;
  color: white;
  padding: 2px 15px;

  background: rgba(80,200,120,1);
}
.status-complete {
  border-radius: 20px;
  color: white;
  padding: 2px 15px;

  background: rgba(114,114,114,1);
}
.file-details{
  height: 45px;
  border: 1px solid #959595;
  border-radius: 6px;
  padding: 10px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  /* margin-top: 50px; */
  color: #959595;
  /* font-size: 20px; */
}
.file-details-modal{
  height: 40px;
  border: 1px solid #d5d5d5;
  border-radius: 4px;
  padding: 10px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
  /* margin-top: 50px; */
  color: #959595;
  /* font-size: 20px; */
}
.file-details-modal:hover{
  border: 1px solid #000;
}
.selected{
  border: 1px solid #000;
}
.show-less{
height: 750px;overflow: hidden;
}
.voter-container{
    height: 50px;
  border-bottom: 1px solid #D5D5D5;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  font-size: 14px;
}
.voter-count-handler{
    height: 50px;
  font-size: 16px;
  display: flex;
  justify-content: center;
  align-items: center;

  color: #959595;
  font-weight: 900;
  cursor: pointer;
}

</style>