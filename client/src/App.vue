<template>
    <nav class= "fixed-left" style = "border-right: 1px solid #d5d5d5; width: 85px; height: 100%">
		<ul class="nav flex-column ">
			<li class="nav-item my-2">
				<a class="nav-link" href="#">
					<img src="./assets/logo/logo.png" alt="logo" style="height: 40px;">
				</a>
			</li>
			<li v-for = "(i) in account.townhalls" class="nav-item mt-2">
				<a @click="goTownhall(i.details.slug)" class="nav-link">
					<img  :src="i.details.avatar" style = "height: 53px;">
				</a>
			</li>
            <li v-if = "account.setup" class="nav-item" @click="showCreateTownhallModal">
				<a class="nav-link">
					<img src="./assets/plus.png"  style = "height: 50px;">
				</a>
			</li>
		</ul>
	</nav>
    <div style="margin-left: 85px;">
        <header class="header">
            <span style="font-size: 20px; font-weight: bold; padding-left: 18px;">Superwarden</span>
            <button v-if ="account.title == ''" class="btn btn-outline-default float-end" style="margin-right: 15px;" @click="connectWallet">Connect Wallet</button>
            <button v-else class="dropdown btn btn-outline-default float-end" style="margin-right: 25px; width: 130px;" @click="toggleShow = !toggleShow">{{trimmedAccountName(account.title)}}</button>
        </header>
        <div v-if="toggleShow" class="top-right-nav" style="right: 25px;">
            <div @click = "goProfile" class="my-2">
                <div class="my-1">
                    <img class="mx-3" src="./assets/avator-person-icon.png" style="width: 20px;"/>
                    <span class="fw-bolder" style="font-size: 15px;">View Profile</span>
                </div>
            </div>
            <div @click="disconnectWallet" class="" style="border-top: 1px solid #d5d5d5;">
                <div class="my-2">
                    <img class="mx-3 my-1" src="./assets/desconnect-icon.png" style="width: 20px;"/>
                    <span class="fw-bolder my-1" style="font-size: 15px;">Disconnect Wallet</span>
                </div>
            </div>
        </div>
        <div @click="toggleShow = false">
            <router-view :key="$route.path"></router-view>
        </div>
    </div>
<!-- Modal Region -->
  <Modal v-model="createTownhallModalShow" :close="closeModal" style="z-index: 9999;">
    <div class="modal-dialog" style="min-width: 600px;">
        <div class="modal-content">
            <div @click="createTownhallModalShow = false">
                <button style="right: 15px; position: absolute;" type="button" class="close border-0 mt-2 fs-4" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-5 px-5 py-4">
                <p class="modal-title mt-4 text-center text-dark fw-bolder" style="font-size: 25px;">Create a townhall</p>
                <div class="mb-3 p-2 text-center">
                    <label class="form-label popup-content-text">The townhall is where your community can vote proposal and listen to announcement broadcast.
                        Create yours and start today.</label>
                </div>
                <div class=" mb-3 text-center">
                    <img class="" src="./assets/townhall-building.png" style="width: 80%;"/>
                </div>
                <div class="mb-1 mt-3 text-center ">
                    <label class="form-label text-center popup-content-text">Note: Each wallet address can only create one townhall</label>
                </div>
                <div class="text-center " style="display: flex; justify-content: center; align-items: center;" >
                    <p class="pt-2 pb-2 text-center popup-content-bold-text popup-content-text-border" style="width: 90%; "><img src="./assets/check.png" style="width: 25px; "/> Every townhall has only one superwarden</p>
                </div>
                <button @click="goSetup()" type="button" class="btn btn-danger text-center mt-3 mb-1" style="width: 100%;">Proceed</button>
            </div>
        </div>
    </div>
  </Modal>
<!-- Modal Region -->

</template>
<script>
import Home from './views/Home.vue'
export default {
    name: "index",
    components: {Home},
    data() {
        return {
            createTownhallModalShow: false,
            account: {
                title : '',
                townhalls: [],
                setup: true,
            },
            toggleShow: false,
            tabs: []
        }
    },
    computed: {

    },

    created() {this.checkTronStatus();},
    mounted() {},
    methods: {
        showCreateTownhallModal(){
            if(!this.account.title){
                this.$toast.error("Please Connect Your Wallet First.")
                return
            }
            this.createTownhallModalShow = true
        },
        trimmedAccountName(name){
            if (name.length > 12)
                return name.slice(0, 5) + "..." + name.slice(name.length - 5, name.length)
            else
                return name
        },
        closeModal() {this.createTownhallModalShow = false;},
        goTownhall(slug){ this.$router.push(`/${slug}/proposal`)},
        goProfile(){ this.$router.push('/profile'); this.toggleShow = false},
        goSetup(){ this.$router.push('/setup'); this.createTownhallModalShow = false},
        checkTronStatus(){
            if(window.tronLink){
                this.connectWallet()
            } else {
                return
            }
        },
        disconnectWallet(){
            this.$store.dispatch('account/resetState')
            this.account.title = ''
            this.account.townhalls = []
            this.account.setup = true
            this.tabs[0].getTownhallList()
            this.toggleShow = false
        },
        getAccountData(){
            let _addr = window.tronWeb.defaultAddress.base58
            //_addr = 'jj'
            
            api.getAccountData({_addr: _addr}, (res => {
                this.$store.dispatch('account/setAccount', res.data.account)
                if (res.data.account.name){
                    this.account.title = res.data.account.name
                } else {
                    this.account.title = res.data.account.address
                }
                this.account.townhalls = []
                this.account.townhalls = res.data.townhalls
                this.account.townhalls.map((i) => {
                    if (i.superwarden == this.$store.getters._addr){
                        this.account.setup = false
                    }

                })
                this.tabs[0].getTownhallList()
            }), err =>{
                console.log(err)
            })
        },
        async connectWallet(){
            // this.getAccountData()

            if (tronLink){ // extension is installed
                const res = await tronLink.request({method: 'tron_requestAccounts'})
                if (tronLink.ready){ // wallet login to tronlink
                    if (res.code == 200){ // at this site wallet connected to tronlink
                        this.getAccountData()
                    } else {
                        window.alert("This wallet isn't verified by tron blockchain.")
                    }
                } else {
                    window.alert("Please login to TronLink extension wallet first.")
                }
            } else {
                window.alert("Please install TronLink to your chrome.")
            }
        },
    }
}
</script>



<style>



nav img {
    display: block;
    margin: auto;
    border-radius: 10px;

}
.nav .nav-item {
    cursor: pointer;
}
header {
    padding-top: 25px;
    padding-bottom: 28px;
    border-bottom: 1px solid #D5D5D5;
    width: 100%;
}

.header button {
    color: #595959;
    border: 1px solid #959595;
}
.top-right-nav {
  border: 1px solid #d5d5d5;
  background-color: #ffffff;
  flex-direction: column;
  border-radius: 5px;
  display: flex;
  cursor: pointer;
  position: absolute;
  z-index: 2;
  width: 200px;
}
</style>
