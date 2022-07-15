<template>

 <div class="head p-2" style="width: 100%;">
      <span class="px-3  py-1 fs-5 fw-bolder" style="border-right: 2px solid #959595;">Proposals </span>
      <div class="options">
          <button @click = "getProposalList(-1)" :class="index === -1?  'selected': ''">All</button>
          <button @click = "getProposalList(1)" :class="index === 1?  'selected': ''">Active</button>
          <button @click = "getProposalList(0)" :class="index === 0?  'selected': ''">Expecting</button>
          <button @click = "getProposalList(2)" :class="index === 2?  'selected': ''">Closed</button>
      </div>
      <div @click="goCreateProposal" v-if ="role  < 4" class="right-button-holder"><button class="right-button">+ Create Proposals</button>
      </div>
  </div>




  <div v-if = "proposals.length > 0" class="right-section-content">
      <div @click="goProposalDetail(p._id)" class="block-container-proposal" v-for="(p) in proposals">
          <div class="header">
              <span class="fw-bolder text-dark" style="font-size: 22px;">{{trimmedProposalTitle(p.title)}}
                </span>
              <span v-if = "p.passed == 1" class="status active">Active</span>
              <span v-else-if = "p.passed == 0" class="status complete">Expecting</span>
              <span v-else class="status complete">Complete</span>
          </div>
          <span class="fw-bolder">Broadcast by {{p.creator.name ? trimmedAccountNameAndLowercase(p.creator.name) +"." + p.slug: trimmedAccountAddress(p.creator.address) }}</span>
          <span class="text-dark" style="height: 100px;">{{trimmedAnnounceSummary(p.description)}}</span>
          <span class="valid-till"><img src="../../assets/clock-icon.png"/>Time left &nbsp;<img src="../../assets/line1.png"/> {{p.leftTime}}</span>
          <span class="cheak" v-if = "p.status == 1"><img src="../../assets/cheack.png" style="height: 25px;"/>Voting under process, result will be announced soon</span>
          <span class="cheak" v-else-if = "p.status == 0"><img src="../../assets/uncheack.png" style="height: 25px;"/>Voting is expecting.8787 johnny.tron as the team leader</span>
          <span class="cheak" v-else><img src="../../assets/uncheack.png" style="height: 25px;"/>{{calculateWinner(p)}}</span>

      </div>
  </div>
  <div v-else class="right-section-no-content">
    <img src="../../assets/townhall-quiet.png" />
    <span>There are no announcements currently. Let’s wait for someone to broadcast. </span>
  </div>
</template>
<script>
import moment from 'moment';

export default {
    name: "Proposal",
    data() {
        return {
          slug : this.$route.params['slug'],
          proposals: [],
          index : 0, //0: expecting 1: on process 2: passed, -1: all

          // role: -1,
        }
    },
    computed: {
      role(){
        return this.$parent.$parent.role
      }

    },
    // computed(){
    //   },
    created() {

      this.getProposalList(-1)

    },
    mounted() {
      

        
    },
    methods: {
      trimmedAccountAddress(addr){
            if (addr.length > 10)
                return addr.slice(0, 5) + "..." + addr.slice(addr.length - 5, addr.length)
            else
                return addr
      },
      trimmedAccountNameAndLowercase(name){
        let string = name.replace(/[, ]+/g, "").trim().toLowerCase();
          if (string.length > 12)
              return string.slice(0, 9) + "..." + string.slice(string.length - 4, string.length)
          else
              return string
      },
      trimmedProposalTitle(title){
        if (title.length > 56)
            return title.slice(0, 56) + "..." 
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
      calculateWinner(p){
        if(p.quorum_status){
          let threshold = p.totalToken * p.percent / 100
          if (p.s_result && (p.s_result[0].option > threshold))
            return p.s_result[0].option + ' is a winner'
          else if (p.result && (p.result[0].option > threshold))
            return p.result[0].option + ' is a winner'
          else 
            return 'No winner.'
        } else {
          if (p.s_result)
            return p.s_result[0].option + ' is a winner'
          else
            return p.result[0].option + ' is a winner'
        }

      },
      goProposalDetail(_id){this.$router.push(`/proposal/detail/${_id}`)},












      goCreateProposal(){this.$router.push(`/proposal/create/${this.slug}`)},
        getProposalList(index){
          this.index = index
          api.getProposalList({slug : this.slug, index: this.index}, (res => {
            this.proposals = res.data.list
            console.log(this.proposals)
            this.proposals.map((p) => {
              let now = new Date()
              let localTimeOffset = now.getTimezoneOffset() * 60 * 1000;
              let localTimeValue = now.getTime() - localTimeOffset
              let serverTimeOffset = moment().utcOffset(p.timezone.offset).utcOffset() * 60 * 1000
              let start_at_f = new Date(p.f_start_at);
              let startTimeValue = start_at_f.getTime() - serverTimeOffset
              let end_at_f = new Date(p.f_end_at);
              let endTimeValue = end_at_f.getTime() - serverTimeOffset
              let toStart = startTimeValue - localTimeValue
              let toEnd = endTimeValue - localTimeValue
              
              if (toStart > 0){
                p.passed = 0
                let day = parseInt(toStart/(1000 * 3600 * 24))
                let hour = parseInt((toStart - day * 1000 * 3600 * 24)/(1000 * 3600))
                let minute = parseInt((toStart - day * 1000 * 3600 * 24 - hour * 1000 * 3600)/(1000 * 60)) 
                p.leftTime = `${day} days ${hour} hours ${minute} minutes`
              } else if (p.status == 2){
                p.leftTime = `Finished`
                console.log(p)
              } else {
                p.passed = 1
                let day = parseInt(toEnd/(1000 * 3600 * 24))
                let hour = parseInt((toEnd - day * 1000 * 3600 * 24)/(1000 * 3600))
                let minute = parseInt((toEnd - day * 1000 * 3600 * 24 - hour * 1000 * 3600)/(1000 * 60)) 
                console.log(minute)

                p.leftTime = `${day} days ${hour} hours ${minute} minutes`
              }
              // 0: expecting 1: on process 2: passed

            })
          }), err =>{
              console.log(err)
          })

      },
      
    }
}
</script>
<style>


.join-button {
  background: transparent;
  border: 1px solid rgba(148, 148, 148, 1);
  border-radius: 5px;
  padding: 5px;
  width: 150px;
}

.join-button span {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 13.5px;
  color: #595959;
}

.nav-content {
  display: flex;
  flex-direction: column;
  padding: 15px;
  margin-top: 20px;
}

.nav-content span {
  padding: 5px 18px;
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 23px;
  color: #595959;
  border-radius: 5px;
}

.nav-content span:hover {
  background: #EEEEEE;
}

.nav-content img {
  height: 20px;
}

.nav-content span.active {
  background: #EEEEEE;
}

.nav-content span.disable {
  color: #959595;
}

.nav-content span.disable:hover {
  background-color: white;
}

.right-section {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  padding: 0px;
  overflow: hidden;
  /* border-right: 2px solid #D5D5D5; */
}




.right-section .head {
  /* width: 100%; */
  height: 80px;
  border-bottom: 1px solid #D5D5D5;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  column-gap: 20px;
}


.right-section>.head .options button {
  margin: 5px;
  width: 100px;
  border-radius: 5px;
  font-size: 17px;
  border: none;
  font-weight: 900;
}

.right-section>.head .options button.selected {
  border: 1px solid #959595;
}



.right-section .head .right-button-holder {
  display: flex;
  flex-grow: 1;
  justify-content: flex-end;
}

.right-section .head .right-button {
  background: rgba(220, 6, 43, 1);
  border-radius: 25px;
  color: white;
  padding: 5px 15px;
  border: none;
  font-family: Inter;
  font-weight: Bold;
  font-size: 13px;
  opacity: 1;
  text-align: left;
}

/* .right-section-content {
  display: flex;
  flex-direction: column;
  row-gap: 30px;
  width: 100%;
  padding: 30px 50px;
} */

.right-section-content .block-container-proposal {
  border: 1px solid #d5d5d5;
  border-radius: 8px;
  padding-left: 30px;
  padding-right: 30px;
  padding-bottom: 10px;
  padding-top: 40px;
  display: flex;
  flex-direction: column;
  row-gap: 20px;
}

.block-container-proposal:hover{
  cursor: pointer;
  border: 1px solid #959595
}
.block-container-proposal .header {
  display: flex;
  justify-content: space-between;
}
/* .block-container-proposal .header .title {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 27px;
  line-height: 30px;
  color: #000000;
} */



.block-container-proposal .header img {
  height: 30px;
}

.block-container-proposal .header .status {
  border-radius: 20px;
  height: 25px;
  padding: 2px 15px;
  color: white;
  font-family: Inter;
  font-weight: Bold;
  font-size: 15px;
}
.block-container-proposal .header .active {
  background: rgba(80,200,120,1);
}
.block-container-proposal .header .complete {
  background: rgba(114,114,114,1);
}

span.broadcast {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 17px;
  line-height: 20px;
  color: #595959;
}

span.description {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 400;
  font-size: 14px;
  line-height: 16px;
  color: #000000;
}

span.valid-till {
  display: flex;
  font-size: 17px;
  line-height: 20px;
}

span.valid-till img {
  height: 25px;
  margin-right: 5px;
}
span.cheak {
  display: flex;
  align-items: center;
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 18px;
  line-height: 20px;
  color: #595959;
  border-top: 1px solid #d5d5d5;
  margin-left: -30px;
    margin-right: -30px;
    padding: 10px 30px 0px 30px;
}

span.cheak img {
  height: 30px;
  margin-right: 5px;
}


.links {
  display: flex;
  align-items: flex-end;
  justify-content: flex-end;
  padding: 15px;
  margin-top: 50px;
  /* border-right: 2px solid #D5D5D5; */
}

.links .icons {
  display: flex;
  column-gap: 10px;
}

.links .icons>img {
  height: 30px;
}
.right-section-no-content {
  display: flex;
  flex-grow: 1;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  row-gap: 30px;
  width: 100%;
  padding: 30px 50px;
  font-family: 'Inter';
  font-style: normal;
  font-weight: 400;
  font-size: 18px;
  line-height: 20px;
  color: #959595;
}
.right-section-no-content > img{
  height: 200px;
}
</style>