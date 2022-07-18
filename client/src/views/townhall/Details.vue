<template>
 <div class="head p-2" style="width: 100%;">
      <span class="px-5  py-1 fs-5 fw-bolder" style="border-right: 2px solid #959595;">Details </span>
      <div class="options">
          <span>{{details.name}}</span>
      </div>
  </div>

  <!-- <div class="right-section-content" style="height: 73.8vh; overflow-y: scroll;"> -->
  <div class="right-section-content">

    <img :src="details.bannerPhoto" style="height: 220px;"/>
    <div v-html="markdownToHtml" class="custom-markdown"></div>
  </div>
  
           
            

                
            
        
    
</template>
<script>
import { marked } from 'marked';

export default {
    name: "Details",
    data() {
        return {
          slug : this.$route.params['slug'],
          details: {}
        }
    },
    computed: {
        markdownToHtml(){
            if (this.details.details){
                return marked.parse(this.details.details.toString())  ;
            }
        }
    },
    created() {
      this.$parent.$parent.tag = 'd'

        this.getTownhallData()
    },
    // mounted() {},
    methods: {
      getTownhallData(){
        api.getTownhallData({slug: this.slug}, (res => {
          if (res.data.townhall){
            console.log(this.$store.getters.name)
            this.details = res.data.townhall.details
            // if (this.townhall.superwarden == this.$store.getters._addr){
            //   this.role = 0
            // } else if (this.townhall.details.warden.includes(this.$store.getters.name) || this.townhall.details.warden.includes(this.$store.getters.name._addr)){
            //   this.role = 1
            // } else if (this.townhall.details.master.includes(this.$store.getters.name) || this.townhall.details.master.includes(this.$store.getters._addr)){
            //   this.role = 2
            // }
          } else {

          }
        }), err =>{
            console.log(err)
        })
      },


      
    }
}
</script>
<style>


.right-section {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  padding: 0px;
  overflow: hidden;
  /* border-right: 2px solid #D5D5D5; */
}

.right-section .head {
  width: 100%;
  height: 85px;
  border-bottom: 2px solid #D5D5D5;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding: 20px;
  column-gap: 20px;
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


.right-section>.head .options span {
  /* background: #FFFDFD; */
  /* width: 50px; */
  margin: 5px;
  /* width: 100px; */
  border-radius: 5px;
  font-size: 17px;
  border: none;
  font-weight: 900;
  /* padding: 5px 20px; */
  /* cursor: pointer; */
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

</style>