<template>
  <div class="head p-2" style="width: 100%;">
      <span class="px-3  py-1 fs-5 fw-bolder" style="border-right: 2px solid #959595;">Announcement</span>
      <div class="options">
          <button @click = "getAnnouncementList('all')" :class="index === 'all'?  'selected': ''" style="background-color: #fff">All</button>
          <button @click = "getAnnouncementList('open')" :class="index === 'open'?  'selected': ''" style="background-color: #fff">Open</button>
          <button @click = "getAnnouncementList('important')" :class="index === 'important'?  'selected': ''" style="background-color: #fff">Important</button>
          <button @click = "getAnnouncementList('closed')" :class="index === 'closed'?  'selected': ''" style="background-color: #fff">Closed</button>
      </div>
      <div v-if = "role < 2" class="right-button-holder"><button @click="goCreateAnnouncement" class="right-button">+ Broadcast Announcement</button>
      </div>
  </div>
  <div v-if = "announcements.length > 0" class="right-section-content" style="height: 73.8vh; overflow-y: scroll;">




    <div @click="goAnnounceDetail(i._id)"  class="block-container-announcement" v-for = "(i) in announcements">
      <div class="header">
          <span class="fw-bolder text-dark" style="font-size: 22px;">{{trimmedAnnounceTitle(i.title)}}
            <img v-if = "i.importance"      class="mb-1"    src="../../assets/staricon.png" />
          </span>
          <span   v-if="i.passed" class="status complete" style="justify-content: center;
    vertical-align: middle;
    display: inline-table;">closed</span>
          <span v-else class="status active" style="justify-content: center;
    vertical-align: middle;
    display: inline-table;">open</span>

      </div>
          <span class="fw-bolder">Broadcast by {{i.creator.name ? trimmedAccountNameAndLowercase(i.creator.name) +"." + i.slug: trimmedAccountAddress(i.creator.address) }}</span>
          <span class="text-dark" style="height: 100px">{{trimmedAnnounceSummary(i.summary)}}</span>
          <span class="valid-till"><img src="../../assets/clock-icon.png"/>Valid Till &nbsp;<img src="../../assets/line1.png" style="height: 20px;"/> {{getDateString(i.expire_at)}} ({{'UTC ' + i.timezone.offset}})</span>
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
          index: '',
          date: '',
          announcements: [],


        }
    },
    computed: {
      role(){return this.$parent.$parent.role},

    },

    created() {
      this.$parent.$parent.tag = 'a'
      this.getAnnouncementList('all')

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
        goAnnounceDetail(_id){this.$router.push(`/announcement/detail/${_id}`)},
        getDateString(string){
          const monthNames = ["January", "February", "March", "April", "May", "June",
              "July", "August", "September", "October", "November", "December"];
          let t = new Date(string)
          const date = ('0' + t.getDate()).slice(-2);
          const month = monthNames[t.getMonth()]
          const year = t.getFullYear();
          return `${date} ${month} ${year}`;
        },
      goCreateAnnouncement(){this.$router.push(`/announcement/create/${this.slug}`)},
      getAnnouncementList(index){
        this.index = index;
        api.getAnnouncementList({slug: this.slug, index: this.index}, (res => {
          this.announcements = res.data.list
          this.announcements.map((i, index) => {
                var userTime = new Date(i.expire_at);
                let userTimeOffset = moment().utcOffset(i.timezone.offset).utcOffset() * 60 * 1000
                let userTimeValue = userTime.getTime() - userTimeOffset
                let now = new Date()
                let localTimeOffset = now.getTimezoneOffset() * 60 * 1000;
                let localTimeValue = now.getTime() - localTimeOffset
                if (userTimeValue > localTimeValue){
                    i.passed = false;
                }
                else{
                    i.passed = true
                }
            })
          console.log(this.announcements)
            }), err =>{
                console.log(err)
            })
      },
    }
}
</script>
<style>


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
  /* background: #FFFDFD; */
  /* width: 50px; */
  margin: 5px;
  width: 100px;
  border-radius: 5px;
  font-size: 17px;
  border: none;
  font-weight: 900;
  /* padding: 5px 20px; */
  /* cursor: pointer; */
}

.right-section>.head .options button.selected {
  border: 1px solid #959595;
}
.right-section>.head .options button.none {
  cursor: default;
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

.right-section-content {
  display: flex;
  flex-direction: column;
  row-gap: 30px;
  width: 100%;
  padding: 30px 50px;
}

.right-section-content .block-container-announcement {
  border: 1px solid #d5d5d5;
  border-radius: 8px;
  padding-left: 30px;
  padding-right: 30px;
  padding-bottom: 30px;
  padding-top: 40px;
  display: flex;
  flex-direction: column;
  row-gap: 20px;
}
.block-container-announcement .header {
  display: flex;
  justify-content: space-between;
}

.block-container-announcement .header .title {
  /* line-height: 1px; */
}

.block-container-announcement:hover{
  cursor: pointer;
  border: 1px solid #959595
}
.block-container-announcement .header img {
  height: 30px;
}

.block-container-announcement .header .status {
  border-radius: 20px;
  height: 25px;
  padding: 2px 15px;
  color: white;
  font-family: Inter;
  font-weight: Bold;
  font-size: 15px;
}
.block-container-announcement .header .active {
  background: rgba(80,200,120,1);
}
.block-container-announcement .header .complete {
  background: rgba(114,114,114,1);
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