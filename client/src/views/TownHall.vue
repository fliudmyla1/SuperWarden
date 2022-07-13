<template>
  <div class="row m-0" style="width: 100%">
    <div class="col-md-3  p-0" style="    border-right: 1px solid #d5d5d5">
      <img v-if = "townhall.details.coverPhoto == ''" src="../assets/card-cover-photo.png" style="width: 100%; height: 185px" />
      <img v-else :src="townhall.details.coverPhoto" style="width: 100%; height: 185px" />
      <div class="text-center" >
        <img :src="townhall.details.avatar" style="margin-top: -40px; background-color: #ffffff; width: 85px; border-radius: 50%; border: 2px solid #ffffff;"/>
      </div>
      <p class="text-center fw-bolder fs-5 text-dark my-2">{{townhall.details.name}}</p>
      <p class="text-center fw-bolder">{{townhall.villagers.length}} Villagers</p>
      <div class="text-center">
        <button v-if = "role < 10" class="join-button"><span>Joined</span></button>
        <button v-else class="join-button"><span>Join</span></button>
      </div>
      <div class="mt-5 ms-5">
        <p @click="clickProposal" class="mt-4 fw-bolder fs-5" style="cursor: pointer;">Proposals</p>
        <p @click="clickAnnouncement" class="mt-4 fw-bolder fs-5" style="cursor: pointer;">Announcements</p>
        <p @click="clickDetails" class="mt-4 fw-bolder fs-5" style="cursor: pointer;">Details</p>
        <p v-if = "role > 1" class="mt-4 fw-bolder fs-5" style="color: #959595;">Settings <img src="../assets/lock.png" style="height: 25px;"/></p>
        <p v-else @click="clickSetting" class="mt-4 fw-bolder fs-5" style="cursor: pointer;">Settings</p>

      </div>

      <div class="links">
          <div class="icons">
            <a :href="townhall.details.twitter"><img src="../assets/twiter-icon.png"></a>
            <a><img src="../assets/game-icon.png"></a>  
            <a :href="townhall.details.github"><img src="../assets//github-icon.png"></a>  
            <a :href="townhall.details.discord"><img src="../assets/browser-icon.png"></a>  
          </div>
      </div>
    </div>
    <div class="col-md-9 m-0 p-0 right-section">
      <router-view />
    </div>
  </div>
</template>
<script>
export default {
    name: "TownHall",
    data() {
        return {
          slug : this.$route.params['slug'],
          role: 10, // 0: superwarden, 1: warden, 2: master, 3: villager but create proposal, 4: villager 10: not joined
          townhall: {
            villagers: [],
            details: {}
          }
        }
    },
    // computed: {},
    created() {this.getTownhallData()},
    // mounted() {},
    methods: {
      getTownhallData(){
        api.getTownhallData({slug: this.slug}, (async (res) => {
          if (res.data.townhall){
            this.townhall = res.data.townhall
            if (this.townhall.superwarden == this.$store.getters._addr){
              this.role = 0
            } else if (this.townhall.details.warden.includes(this.$store.getters.name) || this.townhall.details.warden.includes(this.$store.getters._addr)){
              this.role = 1
            } else if (this.townhall.details.master.includes(this.$store.getters.name) || this.townhall.details.master.includes(this.$store.getters._addr)){
              this.role = 2
            } else {
              if (this.townhall.details.threshold.status || this.townhall.details.tcr.status){
                let proposability = false
                if (this.townhall.details.threshold.tk_addr){
                  var contract = await tronWeb.contract().at(this.townhall.details.threshold.tk_addr)
                  var my_balance = await contract.methods.balanceOf(window.tronWeb.defaultAddress.base58).call();
                  let balance = parseInt(my_balance.toString())
                  if (balance > parseInt(this.townhall.details.threshold.threshold)){
                    proposability = true 
                  }
                }
                if (this.townhall.details.tcr.tk_addr){
                  var contract = await tronWeb.contract().at(this.townhall.details.tcr.tk_addr)
                  var my_balance = await contract.methods.balanceOf(window.tronWeb.defaultAddress.base58).call();
                  let balance = parseInt(my_balance.toString())
                  if (balance > 0){
                    proposability = true
                  }
                }
                if (proposability)
                  this.role = 3
                else
                  this.role = 4
              } else {
                this.role = 4
              }
            }
          } else {
            this.$toast.error("DB or Server Error")

          }
        }), err =>{
            console.log(err)
        })
      },
      clickProposal(){ this.$router.push(`/${this.slug}/proposal`)},
      clickAnnouncement(){ this.$router.push(`/${this.slug}/announcement`)},
      clickDetails(){ this.$router.push(`/${this.slug}/details`)},
      clickSetting(){this.$router.push(`/setting/${this.slug}`)},
    }
}
</script>
<style>
.content {
  width: 100%;
  display: flex;
  max-width: 2000px;
  margin: 0px auto;
  align-items: stretch;
}

.left-section {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  padding: 0px;
  overflow: hidden;
  border-right: 2px solid #D5D5D5;
}

.cover-photo {
  width: 100%;
  height: 200px;
  background: url('../assets/card-cover-photo.png');
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  position: relative;
}

.profile {
  width: 80px;
  height: 80px;
  position: absolute;
  bottom: -40;
  left: 50%;
  transform: translate(-40px);
  border: 3px solid rgba(255, 255, 255, 1);
  border-radius: 50%;
}

.card-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 10px;
  margin-top: 35px;
}

.card-title {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 800;
  font-size: 22px;
  height: 30px;
  color: #000000;
}

.villagers-count {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 16px;
  color: #595959;
  height: 30px;
}

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

.nav-content div {
  padding: 5px 18px;
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 23px;
  color: #595959;
  /* border-radius: 5px; */
    cursor: pointer;
}

.nav-content div:hover {
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
}



.right-section>.head .options span.selected {
  border: 2px solid #959595;
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

.right-section-content .block-container {
  border: 1px solid #959595;
  border-radius: 10px;
  padding: 30px;
  padding-bottom: 10px;
  display: flex;
  flex-direction: column;
  row-gap: 20px;
}

.block-container .header .title {
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 27px;
  line-height: 30px;
  color: #000000;
}

.block-container .header {
  display: flex;
  justify-content: space-between;
}

.block-container .header img {
  height: 30px;
}

.block-container .header .status {
  border-radius: 20px;
  height: 25px;
  padding: 2px 15px;
  color: white;
  font-family: Inter;
  font-weight: Bold;
  font-size: 15px;
}
.block-container .header .active {
  background: rgba(80,200,120,1);
}
.block-container .header .complete {
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
  align-items: center;
  font-family: 'Inter';
  font-style: normal;
  font-weight: 700;
  font-size: 18px;
  line-height: 20px;
  color: #595959;
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
  border-top: 1px solid #959595;
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
  /* border-right: 2px solid #D5D5D5; */
}

.links .icons {
  display: flex;
  column-gap: 10px;
}

.links .icons>a>img {
  height: 30px;
}

</style>