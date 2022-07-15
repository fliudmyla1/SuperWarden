<template>
    <!-- <div>
        <form v-on:submit.prevent="validate" autocomplete="off" id="Form">
          <div class="form-row">
            <div class="col-md-4 mb-3">
              <label for="firstName">First name</label>
              <input  v-model="firstName" 
                      v-bind:class="{ 'is-valid': validation.valid.firstName, 'is-invalid': validation.invalid.firstName }" 
                      v-on:focus="clearValidation('firstName')" 
                      id="firstName" placeholder="First name" class="form-control" autocomplete="false"/>
              <div class="valid-feedback" v-if="validation.valid.firstName">{{ validation.valid.firstName }}</div>
              <div class="invalid-feedback" v-if="validation.invalid.firstName">{{ validation.invalid.firstName }}</div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="firstName">Last name</label>
              <input v-model="lastName"
                     :class="{ 'is-valid': validation.valid.lastName, 'is-invalid': validation.invalid.lastName }" 
                     v-on:focus="clearValidation('lastName')"  
                     id="lastName" placeholder="Last name" class="form-control" />
              <div class="valid-feedback" v-if="validation.valid.lastName">{{ validation.valid.lastName }}</div>
              <div class="invalid-feedback" v-if="validation.invalid.lastName">{{ validation.invalid.lastName }}</div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="userName">Username</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="userName">@</span>
                </div>
                <input v-model="userName"
                      :class="{ 'is-valid': validation.valid.userName, 'is-invalid': validation.invalid.userName }" 
                      v-on:focus="clearValidation('userName')"  
                      id="userName" placeholder="Username" class="form-control"  />
                <div class="valid-feedback" v-if="validation.valid.userName">{{ validation.valid.userName }}</div>
                <div class="invalid-feedback" v-if="validation.invalid.userName">{{ validation.invalid.userName }}</div>
              </div>
            </div>
            <div class="col-sm-12">
              <button class="btn btn-primary" type="submit">Submit form</button>
            </div>
            </div>
        </form>
    </div> -->
    <div style="padding-left: 35px; margin-left: 100px;">
        <button type=" " class="btn btn-default mt-3 p-0" @click="backToProposal"><b>&#8592; Back</b></button>
        <p class="mt-5  fw-bolder fs-1 text-dark">Create a proposal</p>

        <div class="mt-4 mb-5" >


            <form v-if ="steps == 1"     v-on:submit.prevent="validateFirstStep" autocomplete="off" id="Form" class="row" style="width: 100%;">
				<div class="col-md-7">
					<p class="fw-bolder fs-4 mt-3">1. General Info</p>
                    <div class="mb-3 mt-3">
						<label for="name" class="form-label fw-bolder fs-6">Title of proposal</label>
						<input  v-model = "stepOne.title"
                                v-bind:class="{ 'is-valid': validation.valid.title, 'is-invalid': validation.invalid.title }" 
                                v-on:focus="clearValidation('title')" 
                                id="title" class="form-control" autocomplete="false" style="width: 80%;">
                        <div class="valid-feedback" v-if="validation.valid.title">{{ validation.valid.title }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.title">{{ validation.invalid.title }}</div>
					</div>
                    <div class="mb-3">
						<label for="bio" class="form-label fw-bolder fs-6">Short description</label>
						<textarea v-model = "des"
                            :class="{ 'is-valid': validation.valid.description, 'is-invalid': validation.invalid.description }"
                            v-on:focus="clearValidation('description')" 
                            rows="6" placeholder="60 word max" class="form-control"  style="width: 80%;"></textarea>
                        <div class="valid-feedback" v-if="validation.valid.description">{{ validation.valid.description }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.description">{{ validation.invalid.description }}</div>
					</div>
                    <div class="mb-3 mt-3">
						<label for="name" class="form-label fw-bolder fs-6">Discussions</label>
						<p class="fw-bolder" style="color: #959595; font-size: 14px;">Paste the links to the discussion post or forum of this proposal</p>
                        <div v-for="(item, index) in stepOne.discussions">
                            <input v-model="stepOne.discussions[index]" type="text" class="form-control d-inline" style="width: 80%;">
                            <button @click="pushOneDiscussion" class="btn ms-4 superwarden-border" type = "button" style="font-size: 16px;">+</button>
                            <button @click="sliceOneDiscussion(index)" v-if = "index > 0" class="btn ms-4 superwarden-border" type = "button" style="font-size: 16px;">-</button>
                        </div>
					</div>
                    <div class="mb-3 mt-3">
						<label for="name" class="form-label fw-bolder fs-6">Attachments</label>
						<p class="fw-bolder" style="color: #959595; font-size: 14px;">Paste the links of the attachments of this proposal</p>
                        <div v-for="(item, index) in stepOne.attachments">
                            <input v-model="stepOne.attachments[index]" type="text" placeholder="https://www.superwardenforum.com/post2" class="form-control d-inline" style="width: 80%;">
                            <button @click="pushOneAttachment" class="btn ms-4 superwarden-border" style="font-size: 16px;">+</button>
                            <button @click="sliceOneAttachment(index)" v-if = "index > 0" class="btn ms-4 superwarden-border" style="font-size: 16px;">-</button>
                        </div>
					</div>
                    <button class="btn btn-danger float-end px-4" type="submit" style="margin-right: 20%;">Next</button>
                </div>
            </form>












            <form v-if ="steps == 2"         v-on:submit.prevent="validateSecondStep" autocomplete="off"                          class="row" style="width: 100%;">
				<div class="col-md-7">

                    <p class="fw-bolder fs-4 mt-3">2. Proposal Summary</p>
                    
                        <p class="fw-bolder" style="color: #959595; font-size: 14px;">Write down what’s your proposal about. Format your proposal summary in Markdown.</p>

                          <div class=" p-2 border-bottom-0" style=" height: 45px; border-radius: 5px 5px 0px 0px;
                            border: 1px solid #959595;
                            display: flex;
                            justify-content: flex-start;
                            align-items: center;
                            column-gap: 20px;">
                                <span @click="setEdit" class="fw-bolder" style="font-size: 15px; color: #959595; cursor: pointer;"><img src = "../assets/edit.png" style="height: 22px;"/> Edit</span>
                                <span @click="setPreview" class="fw-bolder" style="font-size: 15px; color: #959595; cursor: pointer;"><img src = "../assets/preview.png" style="height: 22px;"/> Preview</span>
                            </div>
                            <div v-if = "preview" v-html = "previewContent"
                                class="form-control border-top-0" style="border: 1px solid #959595; border-radius: 0px 0px 5px 5px; min-height: calc(1.5em + 0.75rem + 2px);
                                resize: vertical;     margin: 0; height: 32.4rem; overflow-y: scroll;"
                            ></div>
                        <textarea v-else v-model = "stepTwo.summary"
                            v-bind:class="{ 'is-valid': validation.valid.summary, 'is-invalid': validation.invalid.summary }" 
                            v-on:focus="clearValidation('summary')"
                            rows="21"  class="form-control border-top-0" style="border: 1px solid #959595; border-radius: 0px 0px 5px 5px;"></textarea>
                        <div class="valid-feedback" v-if="validation.valid.summary">{{ validation.valid.summary }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.summary">{{ validation.invalid.summary }}</div>
                        <button type=" " class="btn btn-default mt-4 p-0 float-start" @click="goBack"><b>&#8592; Back</b></button>
                        <button class="btn btn-danger float-end mt-4 px-4" type="submit">Next</button>
                </div>
                <div class="col-md-5" style="display: flex; justify-content: center; align-items: center;">
                    <div>
                        <p class="fw-bolder fs-6">Markdown Tips</p>
                        <p class="fw-bolder mb-2 superwarden-text-small"><span class="dot"></span>## Heading 2</p>
                        <p class="fw-bolder superwarden-text-small"><span class="dot"></span>### Heading 3</p>
                        <p class="fw-bolder superwarden-text-small"><span class="dot"></span>**Bold**</p>
                        <p class="fw-bolder superwarden-text-small"><span class="dot"></span>[links](https://www.superwarden.com)</p>
                        <p class="fw-bolder superwarden-text-small"><span class="dot"></span>![image](https://image.com/apple.png)</p>
                    </div>
                   
                </div>
            </form>









            <form v-if ="steps == 3"         v-on:submit.prevent="validateThirdStep" autocomplete="off"                          class="row" style="width: 100%;">
                <div class="col-md-7 pe-2">
                    <p class="fw-bolder fs-4 mt-3">3. Voting System</p>
                    <p class="fw-bolder superwarden-text-small mb-4">Choose a voting system which is suitable for your proposal.</p>
                    <div :class = "{'superwarden-invalid': validation.invalid.type} ">
                        <div @click = "setSystem(0)" class="voting-sys p-4 mb-4" :class="stepThree.type === 0?  'selected': ''">
                            <p class="fw-bolder fs-6">Single Choice Voting</p>
                            <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                                Each voter can only vote for one candidate or choice. It is ideal for scenario where voter needs to choose on option from many.
                            </p>
                        </div>
                        <div @click = "setSystem(1)" class="voting-sys p-4 mb-4" :class="stepThree.type === 1?  'selected': ''">
                            <p class="fw-bolder fs-6">Approval Voting</p>
                            <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                                Each voter can vote or “approve” multiple choices. Note that each selected choice will receive equal voting power.
                            </p>
                        </div>
                        <div @click = "setSystem(2)" class="voting-sys p-4" :class="stepThree.type === 2?  'selected': ''">
                            <p class="fw-bolder fs-6">Two Round Voting</p>
                            <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                                A single choice voting system with two round. The two candidates or choices who received the most votes in the first round will enter the second round voting.
                            </p>
                        </div>
                    </div>
                    <!-- <div class="form-control"></div> -->
                    <div class="valid-feedback" v-if="validation.valid.type" style="display:flex;">{{ validation.valid.type }}</div>
                    <div class="invalid-feedback" v-if="validation.invalid.type" style="display:flex;">{{ validation.invalid.type }}</div>

                    <div v-if="stepThree.type > -1"             class="mt-5">
                        <p class="fw-bolder fs-5 mt-3">Voting options</p>
                        <p  v-if="stepThree.type == 2" class="fw-bolder superwarden-text-small">Minimum three voting options is required for single choice voting.</p>
                        <p v-else class="fw-bolder superwarden-text-small">Minimum two voting options is required for single choice voting.</p>
                        <div v-for="(item, index) in stepThree.options">
                            <input v-model="stepThree.options[index]" 
                            v-bind:class="{ 'is-valid': validation.valid.options, 'is-invalid': validation.invalid.options }" 
                            v-on:focus="clearValidation('options')"
                            type="text" class="form-control d-inline" style="width: 80%;">
                            <button v-if = "index > 1 && stepThree.type == 2" @click="pushOneOption" class="btn ms-4 superwarden-border" style="font-size: 16px;">+</button>
                            <button v-if = "index > 0 && (stepThree.type == 0 || stepThree.type == 1 )" @click="pushOneOption" class="btn ms-4 superwarden-border" style="font-size: 16px;">+</button>
                            <button v-if = "index > 2 && stepThree.type == 2" @click="sliceOneOption(index)"  class="btn ms-4 superwarden-border" style="font-size: 16px;">-</button>
                            <button v-if = "index > 1 && (stepThree.type == 0 || stepThree.type == 1 )" @click="sliceOneOption(index)"  class="btn ms-4 superwarden-border" style="font-size: 16px;">-</button>
                        </div>
                    </div>
                    <div class="invalid-feedback" v-if="validation.invalid.options" style="display: flex">{{ validation.invalid.options }}</div>
                                            <button type=" " class="btn btn-default mt-5 p-0 float-start" @click="goBack"><b>&#8592; Back</b></button>

                    <button class="btn btn-danger float-end mt-5 px-4" type="submit">Next</button>
                </div>

            </form>







                


            
            <form v-if ="steps == 4"                  v-on:submit.prevent="validateFourthStep" autocomplete="off"                          class="row" style="width: 100%;">
                <div class="col-md-10">
                    <p class="fw-bolder fs-4 mt-3">4. Voting Strategies</p>
                    <p class="fw-bolder superwarden-text-small mb-4">Choose a voting strategies which is suitable for your proposal.</p>
                    <div class="row" :class = "{'superwarden-invalid': validation.invalid.strategy} ">
                        <div class="col-md-6">
                                        <div @click = "setStrategy('trc-10')" class="voting-sys p-4 mb-4" :class="stepFour.strategy ===  'trc-10'?  'selected': ''">
                        <p class="fw-bolder fs-6">TRC-10 Balance</p>
                        <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                            The balance of TRC-10 token in the voter’s wallet will be used to calculate the voting result. One token represents one vote (1T1V).
                        </p>
                    </div>
                                        <div @click = "setStrategy('trc-20')" class="voting-sys p-4 mb-4" :class="stepFour.strategy === 'trc-20'?  'selected': ''">
                        <p class="fw-bolder fs-6">TRC-20 Balance</p>
                        <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                            The balance of TRC-20 token in the voter’s wallet will be used to calculate the voting result. One token represents one vote (1T1V).
                        </p>
                    </div>
                                        <div @click = "setStrategy('trc-721')" class="voting-sys p-4 mb-4" :class="stepFour.strategy === 'trc-721'?  'selected': ''">
                        <p class="fw-bolder fs-6">TRC-721 Voting </p>
                        <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                            The amount of TRC-721 token (NFT) in the voter’s wallet will be used to calculate the voting result. One token represents one vote (1T1V).
                        </p>
                    </div>
                                        <div @click = "setStrategy('whitelist')" class="voting-sys p-4" :class="stepFour.strategy === 'whitelist'?  'selected': ''">
                        <p class="fw-bolder fs-6">Whitelist Voting</p>
                        <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                            Voters in the whitelist can vote the proposal. Each of the voter will have a voting ticket with custom symbol. One person represents one vote (1P1V) and it is a single choice voting.
                        </p>
                    </div>

                        </div>
                        <div class="col-md-6">
                            <div @click = "setStrategy('trc-10-th')" class="voting-sys p-4 mb-4" :class="stepFour.strategy === 'trc-10-th'?  'selected': ''">
                                <p class="fw-bolder fs-6">TRC-10 Balance /w Threshold</p>
                                <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                                    In order to vote, the balance of TRC-10 token in the voter’s wallet need to be equal or greater than the minimum threshold set. 
                                </p>
                            </div>
                            <div @click = "setStrategy('trc-20-th')" class="voting-sys p-4 mb-4" :class="stepFour.strategy  === 'trc-20-th'?  'selected': ''">
                                <p class="fw-bolder fs-6">TRC-20 Balance /w Threshold </p>
                                <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                                    Each voter can only vote for one candidate or choice. It is ideal for scenario where voter needs to choose on option from many.
                                </p>
                            </div>
                            <div @click = "setStrategy('trc-721-multi')" class="voting-sys p-4" :class="stepFour.strategy === 'trc-721-multi'?  'selected': ''">
                                <p class="fw-bolder fs-6">TRC-721 Voting /w Multiplier </p>
                                <p class= "fw-bolder p-0 m-0 superwarden-text-small">
                                    Each voter can only vote for one candidate or choice. It is ideal for scenario where voter needs to choose on option from many.
                                </p>
                            </div>
                        </div>

                    </div> 


                    <div class="invalid-feedback" v-if="validation.invalid.strategy" style="display:flex;">{{ validation.invalid.strategy }}</div>
                                            <button type=" " class="btn btn-default mt-5 p-0 float-start" @click="goBack"><b>&#8592; Back</b></button>

                    <button class="btn btn-danger float-end mt-5 px-4" type="submit">Next</button>
                </div>
                <div class="col-md-2"></div>
            
            </form>

        
            <form v-if ="steps == 5"              v-on:submit.prevent="validateFifthStep" autocomplete="off"                          class="row" style="width: 100%;">
            <div class= "col-md-6">
                <p class="fw-bolder fs-4 mt-3">5. Voting Strategy Settings</p>
                <div v-if = "stepFour.strategy ===  'trc-10-th' || stepFour.strategy ===  'trc-20-th'">
                    <div class="mb-3 mt-5">
						<label for="name" class="form-label fw-bolder fs-6" >Token symbol</label>
						<input  v-model = "stepFive.tk_symbol" 
								v-bind:class="{ 'is-valid': validation.valid.tk_symbol, 'is-invalid': validation.invalid.tk_symbol }" 
                                v-on:focus="clearValidation('tk_symbol')" 
								type="text" class="form-control"  placeholder="Eg. TRX">
						<div class="valid-feedback" v-if="validation.valid.tk_symbol">{{ validation.valid.tk_symbol }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.tk_symbol">{{ validation.invalid.tk_symbol }}</div>
					</div>
                    <div class="mb-3 mt-4">
						<label for="name" class="form-label fw-bolder fs-6" >Contract address</label>
						<input  v-model = "stepFive.ctr_addr" 
								v-bind:class="{ 'is-valid': validation.valid.ctr_addr, 'is-invalid': validation.invalid.ctr_addr }" 
                                v-on:focus="clearValidation('ctr_addr')" 
								type="text" class="form-control" >
						<div class="valid-feedback" v-if="validation.valid.ctr_addr">{{ validation.valid.ctr_addr }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.ctr_addr">{{ validation.invalid.ctr_addr }}</div>
					</div>
                    <div class="mb-3 mt-4">
						<label for="name" class="form-label fw-bolder fs-6" >Minimum threshold</label>
						<input  v-model = "stepFive.threshold" 
								v-bind:class="{ 'is-valid': validation.valid.threshold, 'is-invalid': validation.invalid.threshold }" 
                                v-on:focus="clearValidation('threshold')" 
								type="number" class="form-control" placeholder="Eg. 1000">
						<div class="valid-feedback" v-if="validation.valid.threshold">{{ validation.valid.threshold }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.threshold">{{ validation.invalid.threshold }}</div>
					</div>
                    <div class="form-check mt-4 mb-3">
						<input  v-model = "stepFive.quorum_status" class="form-check-input" type="checkbox">
						<label  class="form-check-label fw-bolder fs-6" for="flexCheckDefault" style="font-weight: bold;">
							Apply quorum threshold?
						</label>
						<p class="fw-bolder" style="color: #959595; font-size: 14px;">A quorum is the minimum number of participating members or tokens required for a proposal to be approved.</p>
                        <input v-if ="stepFive.quorum_status" v-model = "stepFive.percent" 
								v-bind:class="{ 'is-valid': validation.valid.percent, 'is-invalid': validation.invalid.percent }" 
                                v-on:focus="clearValidation('percent')" 
								type="number" class="form-control" placeholder="Enter a percentage (maximum is 100%)">
                        <div class="valid-feedback" v-if="validation.valid.percent">{{ validation.valid.percent }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.percent">{{ validation.invalid.percent }}</div>
                        <input v-if ="stepFive.quorum_status" v-model = "stepFive.totalToken" 
								v-bind:class="{ 'is-valid': validation.valid.totalToken, 'is-invalid': validation.invalid.percent }" 
                                v-on:focus="clearValidation('totalToken')" 
								type="number" class="form-control" placeholder="Eg. 100000">
                        <div class="valid-feedback" v-if="validation.valid.totalToken">{{ validation.valid.totalToken }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.totalToken">{{ validation.invalid.totalToken }}</div>
					</div>
                    
                </div>
                <div v-else-if = "stepFour.strategy ===  'trc-721-multi'">
                    <div class="mb-3 mt-5">
						<label for="name" class="form-label fw-bolder fs-6" >Token symbol</label>
						<input  v-model = "stepFive.tk_symbol" 
								v-bind:class="{ 'is-valid': validation.valid.tk_symbol, 'is-invalid': validation.invalid.tk_symbol }" 
                                v-on:focus="clearValidation('tk_symbol')" 
								type="text" class="form-control"  placeholder="Eg. TRX">
						<div class="valid-feedback" v-if="validation.valid.tk_symbol">{{ validation.valid.tk_symbol }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.tk_symbol">{{ validation.invalid.tk_symbol }}</div>
					</div>
                    <div class="mb-3 mt-4">
						<label for="name" class="form-label fw-bolder fs-6" >Contract address</label>
						<input  v-model = "stepFive.ctr_addr" 
								v-bind:class="{ 'is-valid': validation.valid.ctr_addr, 'is-invalid': validation.invalid.ctr_addr }" 
                                v-on:focus="clearValidation('ctr_addr')" 
								type="text" class="form-control" >
						<div class="valid-feedback" v-if="validation.valid.ctr_addr">{{ validation.valid.ctr_addr }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.ctr_addr">{{ validation.invalid.ctr_addr }}</div>
					</div>
                    <div class="mb-3 mt-4">
						<label for="name" class="form-label fw-bolder fs-6" >Multiplier</label>
						<input  v-model = "stepFive.multiplier" 
								v-bind:class="{ 'is-valid': validation.valid.multiplier, 'is-invalid': validation.invalid.multiplier }" 
                                v-on:focus="clearValidation('multiplier')" 
								type="text" class="form-control" placeholder="Eg. 1000">
						<div class="valid-feedback" v-if="validation.valid.multiplier">{{ validation.valid.multiplier }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.multiplier">{{ validation.invalid.multiplier }}</div>
					</div>
                    <div class="form-check mt-4 mb-3">
						<input  v-model = "stepFive.quorum_status" class="form-check-input" type="checkbox">
						<label  class="form-check-label fw-bolder fs-6" for="flexCheckDefault" style="font-weight: bold;">
							Apply quorum threshold?
						</label>
						<p class="fw-bolder" style="color: #959595; font-size: 14px;">A quorum is the minimum number of participating members or tokens required for a proposal to be approved.</p>
                        <input v-if ="stepFive.quorum_status"  v-model = "stepFive.percent" 
								v-bind:class="{ 'is-valid': validation.valid.percent, 'is-invalid': validation.invalid.percent }" 
                                v-on:focus="clearValidation('percent')" 
								type="number" class="form-control" placeholder="Enter a percentage (maximum is 100%)">
                        <div class="valid-feedback" v-if="validation.valid.percent">{{ validation.valid.percent }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.percent">{{ validation.invalid.percent }}</div>
                        <input v-if ="stepFive.quorum_status" v-model = "stepFive.totalToken" 
								v-bind:class="{ 'is-valid': validation.valid.totalToken, 'is-invalid': validation.invalid.percent }" 
                                v-on:focus="clearValidation('totalToken')" 
								type="number" class="form-control" placeholder="Eg. 100000">
                        <div class="valid-feedback" v-if="validation.valid.totalToken">{{ validation.valid.totalToken }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.totalToken">{{ validation.invalid.totalToken }}</div>
					</div>
                </div>
                <div v-else-if = "stepFour.strategy ===  'whitelist'">
                    <div class="mb-3 mt-5">
						<label for="name" class="form-label fw-bolder fs-6" >Ticket symbol</label>
						<input  v-model = "stepFive.tk_symbol" 
								v-bind:class="{ 'is-valid': validation.valid.tk_symbol, 'is-invalid': validation.invalid.tk_symbol}" 
                                v-on:focus="clearValidation('tk_symbol')" 
								type="text" class="form-control"  placeholder="Eg. TRX">
						<div class="valid-feedback" v-if="validation.valid.tk_symbol">{{ validation.valid.tk_symbol }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.tk_symbol">{{ validation.invalid.tk_symbol }}</div>
					</div>
                    <div class="mb-3 mt-3">
						<label for="name" class="form-label fw-bolder fs-6">Whitelist (addresses)</label>
						<input type="file" ref="markdown" @change="onXlsxSelected" 
							accept=".xlsx" style="display: none;"/>
						<div class="input-group mb-3"  @click.prevent="$refs.markdown.click()">
							<input  :value = "filename" 
                                    :class = "{'superwarden-invalid': validation.invalid.whitelist}"
									v-on:focus="clearValidation('whitelist')"
									type="text" class="form-control border-end-0"  readonly placeholder="Upload your whitelist .xlsx file ">
							<span class="input-group-text"><img src="../assets/upload.png" style="height: 22px" /></span>
							<div class="valid-feedback" v-if="validation.valid.whitelist" style="display: flex;">{{ validation.valid.whitelist }}</div>
							<div class="invalid-feedback" v-if="validation.invalid.whitelist" style="display: flex;">{{ validation.invalid.whitelist }}</div>
						</div>
                        <button type="button"  class="btn btn-success fw-bolder py-2" style="width: 50%; font-size: 14px;"><a href="http://64.227.108.139/download" style="color: #fff; text-decoration: none;">Download boilerplate whitelist.xlsx</a></button>

					</div>
                    <div class="form-check mt-4 mb-3">
						<input  v-model = "stepFive.quorum_status" class="form-check-input" type="checkbox">
						<label  class="form-check-label fw-bolder fs-6" for="flexCheckDefault" style="font-weight: bold;">
							Apply quorum threshold?
						</label>
						<p class="fw-bolder" style="color: #959595; font-size: 14px;">A quorum is the minimum number of participating members or tokens required for a proposal to be approved.</p>
                        <input v-if ="stepFive.quorum_status" v-model = "stepFive.percent" 
								v-bind:class="{ 'is-valid': validation.valid.percent, 'is-invalid': validation.invalid.percent }" 
                                v-on:focus="clearValidation('percent')" 
								type="number" class="form-control" placeholder="Enter a percentage (maximum is 100%)">
                        <div class="valid-feedback" v-if="validation.valid.percent">{{ validation.valid.percent }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.percent">{{ validation.invalid.percent }}</div>
                        <input v-if ="stepFive.quorum_status" v-model = "stepFive.totalToken" 
								v-bind:class="{ 'is-valid': validation.valid.totalToken, 'is-invalid': validation.invalid.percent }" 
                                v-on:focus="clearValidation('totalToken')" 
								type="number" class="form-control" placeholder="Eg. 100000">
                        <div class="valid-feedback" v-if="validation.valid.totalToken">{{ validation.valid.totalToken }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.totalToken">{{ validation.invalid.totalToken }}</div>
					</div>
                
                </div>
                <div v-else >
                    <div class="mb-3 mt-5">
						<label for="name" class="form-label fw-bolder fs-6" >Token symbol</label>
						<input  v-model = "stepFive.tk_symbol" 
								v-bind:class="{ 'is-valid': validation.valid.tk_symbol, 'is-invalid': validation.invalid.tk_symbol }" 
                                v-on:focus="clearValidation('tk_symbol')" 
								type="text" class="form-control"  placeholder="Eg. TRX">
						<div class="valid-feedback" v-if="validation.valid.tk_symbol">{{ validation.valid.tk_symbol }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.tk_symbol">{{ validation.invalid.tk_symbol }}</div>
					</div>
                    <div class="mb-3 mt-4">
						<label for="name" class="form-label fw-bolder fs-6" >Contract address</label>
						<input  v-model = "stepFive.ctr_addr" 
								v-bind:class="{ 'is-valid': validation.valid.ctr_addr, 'is-invalid': validation.invalid.ctr_addr }" 
                                v-on:focus="clearValidation('ctr_addr')" 
								type="text" class="form-control" >
						<div class="valid-feedback" v-if="validation.valid.ctr_addr">{{ validation.valid.ctr_addr }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.ctr_addr">{{ validation.invalid.ctr_addr }}</div>
					</div>
                    <div class="form-check mt-4 mb-3">
						<input  v-model = "stepFive.quorum_status" class="form-check-input" type="checkbox">
						<label  class="form-check-label fw-bolder fs-6" for="flexCheckDefault" style="font-weight: bold;">
							Apply quorum threshold?
						</label>
						<p class="fw-bolder" style="color: #959595; font-size: 14px;">A quorum is the minimum number of participating members or tokens required for a proposal to be approved.</p>
                        <input  v-if ="stepFive.quorum_status" v-model = "stepFive.percent" 
								v-bind:class="{ 'is-valid': validation.valid.percent, 'is-invalid': validation.invalid.percent }" 
                                v-on:focus="clearValidation('percent')" 
								type="number" class="form-control" placeholder="Enter a percentage (maximum is 100%)">
                        <div class="valid-feedback" v-if="validation.valid.percent">{{ validation.valid.percent }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.percent">{{ validation.invalid.percent }}</div>
                        <input v-if ="stepFive.quorum_status" v-model = "stepFive.totalToken" 
								v-bind:class="{ 'is-valid': validation.valid.totalToken, 'is-invalid': validation.invalid.percent }" 
                                v-on:focus="clearValidation('totalToken')" 
								type="number" class="form-control" placeholder="Eg. 100000">
                        <div class="valid-feedback" v-if="validation.valid.totalToken">{{ validation.valid.totalToken }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.totalToken">{{ validation.invalid.totalToken }}</div>
					</div>
                </div>
                <button type=" " class="btn btn-default mt-5 p-0 float-start" @click="goBack"><b>&#8592; Back</b></button>
                    <button class="btn btn-danger float-end mt-5 px-4" type="submit">Next</button>

            </div>
            
            </form>
















            <form v-if ="steps == 6"   v-on:submit.prevent="validateSixthStep" autocomplete="off"     class="row" style="width: 100%;">
                <div class= "col-md-6">
                    <p class="fw-bolder fs-4 mt-3">6. Date and Time Settings</p>
                    <div class="mb-4 mt-5">
                        <label for="time-zone" class="form-label fw-bolder fs-6">Timezone</label>
                        <select v-model = "stepSix.timezone" 
                                v-bind:class="{ 'is-valid': validation.valid.timezone, 'is-invalid': validation.invalid.timezone }" 
                                v-on:focus="clearValidation('timezone')"
                                class="form-select">
                            <option value="" selected disabled>Choose your timezone</option>
                            <option :value="t" v-for = "(t) in timezoneList" :label = "t.label"></option>
                        </select>
                        <div class="valid-feedback" v-if="validation.valid.timezone">{{ validation.valid.timezone }}</div>
                        <div class="invalid-feedback" v-if="validation.invalid.timezone">{{ validation.invalid.timezone }}</div>
                    </div>
                    <div class = "row mb-4 mt-2">
                        <div class = "col-md-6" >
                            <div class="input-group ">
                                <label for="time-zone" class="form-label fw-bolder fs-6">Start date</label>

                                <div  style="width: 75%;">

                                    <Datepicker
                                        v-model="stepSix.f_start_date_at" 
                                        class="form-control border-end-0 superwarden-right-border" placeholder="Choose a date" />
                                </div>
                                    <span  class="input-group-text "><img src="../assets/calendar.png" style="height: 20px" /></span>
                            </div>
                        </div>
                        <div class = "col-md-6 " >
                            <div class="input-group float-end" style="width: 97%;">
                            <label for="time-zone" class="form-label fw-bolder fs-6">Start time</label>
                                <div style = "width: 82%;">

                                    <VueTimepicker 
                                        v-model="stepSix.f_start_time_at"
                                        class="form-control border-end-0 p-0 superwarden-right-border" placeholder = "Choose time"/>
                                </div>
                                    <span  class="input-group-text "><img src="../assets/clock.png" style="height: 20px" /></span>
                            </div>
                        </div>
                    
                    </div>
                    <div class = "row mb-4 mt-2">
                        <div class = "col-md-6" >
                            <div class="input-group ">
                                <label for="time-zone" class="form-label fw-bolder fs-6">End date</label>

                                <div  style="width: 75%;">

                                    <Datepicker
                                        v-model="stepSix.f_end_date_at" 
                                        class="form-control border-end-0 superwarden-right-border" placeholder="Choose a date" />
                                </div>
                                    <span  class="input-group-text "><img src="../assets/calendar.png" style="height: 20px" /></span>
                            </div>
                        </div>
                        <div class = "col-md-6 " >
                            <div class="input-group float-end" style="width: 97%;">
                            <label for="time-zone" class="form-label fw-bolder fs-6">End time</label>
                                <div style = "width: 82%;">

                                    <VueTimepicker 
                                        v-model="stepSix.f_end_time_at"
                                        class="form-control border-end-0 p-0 superwarden-right-border" placeholder = "Choose time"/>
                                </div>
                                    <span  class="input-group-text "><img src="../assets/clock.png" style="height: 20px" /></span>
                            </div>
                        </div>
                    
                    </div>
                    <div v-if ="stepThree.type == 2">
                        <div class = "row mb-4 mt-2">
                            <div class = "col-md-6" >
                                <div class="input-group ">
                                    <label for="time-zone" class="form-label fw-bolder fs-6">Start date</label>

                                    <div  style="width: 75%;">

                                        <Datepicker
                                            v-model="stepSix.s_start_date_at" 
                                            class="form-control border-end-0 superwarden-right-border" placeholder="Choose a date" />
                                    </div>
                                        <span  class="input-group-text "><img src="../assets/calendar.png" style="height: 20px" /></span>
                                </div>
                            </div>
                            <div class = "col-md-6 " >
                                <div class="input-group float-end" style="width: 97%;">
                                <label for="time-zone" class="form-label fw-bolder fs-6">Start time</label>
                                    <div style = "width: 82%;">

                                        <VueTimepicker 
                                            v-model="stepSix.s_start_time_at"
                                            class="form-control border-end-0 p-0 superwarden-right-border" placeholder = "Choose time"/>
                                    </div>
                                        <span  class="input-group-text "><img src="../assets/clock.png" style="height: 20px" /></span>
                                </div>
                            </div>
                        
                        </div>
                        <div class = "row mb-4 mt-2">
                            <div class = "col-md-6" >
                                <div class="input-group ">
                                    <label for="time-zone" class="form-label fw-bolder fs-6">End date</label>

                                    <div  style="width: 75%;">

                                        <Datepicker
                                            v-model="stepSix.s_end_date_at" 
                                            class="form-control border-end-0 superwarden-right-border" placeholder="Choose a date" />
                                    </div>
                                        <span  class="input-group-text "><img src="../assets/calendar.png" style="height: 20px" /></span>
                                </div>
                            </div>
                            <div class = "col-md-6 " >
                                <div class="input-group float-end" style="width: 97%;">
                                <label for="time-zone" class="form-label fw-bolder fs-6">End time</label>
                                    <div style = "width: 82%;">

                                        <VueTimepicker 
                                            v-model="stepSix.s_end_time_at" 
                                            class="form-control border-end-0 p-0 superwarden-right-border" placeholder = "Choose time"/>
                                    </div>
                                        <span  class="input-group-text "><img src="../assets/clock.png" style="height: 20px" /></span>
                                </div>
                            </div>
                        
                        </div>
                    </div>
                    <div class="form-check  mb-4 mt-5">
                        <input  v-model = "stepSix.shield" class="form-check-input" type="checkbox">
                        <label  class="form-check-label fw-bolder fs-6" for="flexCheckDefault" style="font-weight: bold;">
                            Shielded Voting?
                        </label>
                        <p class="fw-bolder superwarden-text-small">Votes and voting results are shielded until the voting period is over. Here are some of the benefits:</p>
                        <p class="fw-bolder superwarden-text-small mb-1"><span class="dot"></span>Pre-voting information symmetry</p>
                        <p class="fw-bolder superwarden-text-small mb-1"><span class="dot"></span>Prevent voter apathy and misbehaviour</p>
                        <p class="fw-bolder superwarden-text-small"><span class="dot"></span>Partial privacy</p>
                    </div>
                    <button type=" " class="btn btn-default mt-4 p-0 float-start" @click="goBack"><b>&#8592; Back</b></button>
                    <button class="btn btn-danger float-end mt-4 px-4" type="submit">Next</button>
                </div>
            </form>






















            <div v-if ="steps == 7" class="row" style="width: 100%;">
                <div class= "col-md-6">
                    <p class="fw-bolder fs-4 mt-3">7. Confirmation</p>
                        <div style = "display:inline-table">
                        <div class="mt-4" style="display: flex; float: left">
                            <img src="../assets/check.png" style="width: 25px; height: 25px; margin-top: 2px;"/>
                            <p class="fw-bolder ps-1" style="color: #959595;"> The submitted proposal cannot be edited. However, you have the option to delete the proposal and create again.</p>
                        </div>
                        <div class="mt-2" style="display: flex; float: left">
                            <img src="../assets/check.png" style="width: 25px; height: 25px; margin-top: 2px;"/>
                            <p class="fw-bolder ps-1" style="color: #959595;"> Submitted proposal will be stored on your IPFS storage tools (Web3.Storage and Pinata). Hence, for permanent deletion, you need to delete it from Web3.storage and also unpin the CID at Pinata.</p>
                        </div>
                        <div class="mt-2" style="display: flex; float: left; ">
                            <img src="../assets/check.png" style="width: 25px; height: 25px; margin-top: 2px;"/>
                            <p class="fw-bolder ps-1" style="color: #959595;"> The proposal voting result will be stored on your IPFS storage tools (Web3.Storage and Pinata) when the voting period ends.</p>
                        </div>
                        </div>

                        <div class="form-check mt-4 mb-3" style="display: block;">
                                <input v-model= "stepSeven.check" class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label form-label fw-bolder fs-6" for="flexCheckDefault" style="font-weight: bold;">
                                    I understand my role as a superwarden.
                                </label>
                            </div>

					
						<button type=" " class="btn btn-default mt-4 p-0 float-start" @click="goBack"><b>&#8592; Back</b></button>
                        <button class="btn btn-danger float-end mt-4 px-4" @click = "createProposal">Submit</button>
                </div>
            
            </div>

        </div>
    </div>
</template>
<script>
import { marked } from 'marked';
import timezones from 'compact-timezone-list';
import Datepicker from "vue3-datepicker";
import VueTimepicker from 'vue3-timepicker';
import 'vue3-timepicker/dist/VueTimepicker.css';
import { Web3Storage } from "web3.storage";
import pinataSDK from '@pinata/sdk';
import axios from 'axios';
import readXlsxFile from 'read-excel-file'
// import crypto from 'crypto'
// import cluster from 'cluster';


// import api from './api'

export default {
    name: "CreateProposal",
    components: { Datepicker, VueTimepicker},

    data() {
        return {
            timezoneList: timezones,

            slug : this.$route.params['slug'],
			steps: 1,
            stepOne: {
                title: '',
                description: '',
                discussions: [''],
                attachments: ['']
            },
            stepTwo: {summary: ''},
            stepThree: {
                type :  -1, // 0 : single choice, 1: approval voting 2: two rounding
                options: [], // Proposal means voting.
            },
            stepFour: {strategy: ''},
            stepFive: {},
            stepSix: {},
            stepSeven: {check: false},

            filename: '',
            preview: false,
            previewContent : '',
            des: '',
            validation: { 
                invalid: {},
                valid: {},},
            townhall:{}
            


        }
    },
    computed: {

    },

    created() {
        // console.log(this.slug)
        this.getTownhallData()


    },
    mounted() {
        
        
    },
    watch: {
		des(newQuestion, oldQuestion) {			
			if(String(this.des).match(/(\w+)/g).length > 60)
				this.des = oldQuestion;
			else
				this.des = newQuestion;
			this.stepOne.description = this.des;
		},
    },
    methods: {
        backToProposal(){this.$router.push(`/${this.slug}/proposal`)},
        pushOneDiscussion(){this.stepOne.discussions.push('')},
        sliceOneDiscussion(index){if (index > -1) {this.stepOne.discussions.splice(index, 1);}},
        pushOneAttachment(){this.stepOne.attachments.push('')},
        sliceOneAttachment(index){if (index > -1) {this.stepOne.attachments.splice(index, 1);}},
        pushOneOption(){this.stepThree.options.push('')},
        sliceOneOption(index){ if (index > -1) {this.stepThree.options.splice(index, 1);}},
        setEdit(){ this.preview = false},
        setSystem(index){
            this.stepThree.options = []
            this.clearValidation('type')
            if (index == 2){
                this.stepThree.options.push('')
                this.stepThree.options.push('')
                this.stepThree.options.push('')
            } else {
                this.stepThree.options.push('')
                this.stepThree.options.push('')
            }
            this.stepThree.type = index
        },
        setStrategy(index){
            this.clearValidation('strategy')
            this.stepFour.strategy = index},
        setPreview(){ 
            console.log(this.stepTwo.summary)
            this.previewContent = marked(this.stepTwo.summary)
            this.preview = true},
        goBack(){
            if (this.steps == 5){
                this.stepFive = {}
            }
            this.steps -= 1},
        getTownhallData(){
            api.getTownhallData({slug: this.slug}, (res => {
                
            if (res.data.townhall){
                this.townhall = res.data.townhall
            } else {

            }
            }), err =>{
                console.log(err)
            })
      },
      async  createProposal(){
            if (!this.stepSeven.check)
                return
                let data = {};
            data = Object.assign(this.stepOne, this.stepTwo, this.stepThree, this.stepFour, this.stepFive, this.stepSix);
            if (this.townhall.details.webThrKey){
                var client = new Web3Storage({ token: this.townhall.details.webThrKey});
                const blob = new Blob([JSON.stringify(data)], { type: 'application/json' })
                const ee = [new File([blob], 'superwarden.json')];
                const rootCid = await client.put(ee, {maxRetries: 3});
                // let rootCid = 'afefe'
                if (rootCid){
                    this.$toast.success(`succeeded to ipfs upload`);
                    if (this.townhall.details.pinataKey != '' && this.townhall.details.pinataSecret != ''){
                        const pinata = pinataSDK(this.townhall.details.pinataKey, this.townhall.details.pinataSecret);
                        const options = {
                            pinataMetadata: {
                                name: 'superwarden',
                            },
                        };
                        pinata.pinByHash(rootCid, options).then((result) => {
                                this.$toast.success(`succeeded to pinata upload`);
                            }).catch((err) => {
                                this.$toast.error(`failed to pinata upload`);
                            })
                    } else {
                        this.$toast.error(`please reset your pinata settings`);
                    }

                     api.createProposal({slug: this.slug, _id: this.$store.getters._id, data: data, cid: rootCid}, (res =>{
					if (res.data.proposal){
                            this.$toast.success('created your proposal')
                            this.$router.push(`/${this.slug}/proposal`)
                         } else {
                            this.$toast.error(`fail to connect to the server.`);
                        }

                    }), err => {
                        console.log(err)
                    })
                } else {
                    this.$toast.error(`fail to ipfs upload\n please check your web3.storage api key`);
                }
            } else {
                this.$toast.error(`fail to ipfs upload\n please set your web3.storage api key to your townhall.`);
            }
            // api.createProposal()
            console.log('time to create proposal')
            console.log(this.stepOne)
            console.log(this.stepTwo)
            console.log(this.stepThree)
            console.log(this.stepFour)
            console.log(this.stepFive)
            console.log(this.stepSix)


           
        },
        validateFirstStep(){
            let error = false

            if (!this.stepOne.title) {
                this.validation.invalid.title = 'Please type your title of proposal.';
                error = true
            } else {
                this.validation.valid.title = 'The tile of proposal is OK.';
            }
            if (!this.stepOne.description) {
                error = true
                this.validation.invalid.description = 'Please type your description of proposal.';
            } else {
                this.validation.valid.description = 'The description of proposal is OK.';
            }
            if (error)
                return
            this.steps = 2
            this.validate.valid = {}
            this.validate.invalid = {}
        },
        validateSecondStep(){
            if (!this.stepTwo.summary) {
                this.validation.invalid.summary = 'Please type your summary of proposal.';
                return
            } else {
                this.validation.valid.summary = 'The summary of proposal is OK.';
            }
            this.steps = 3
            this.validate.valid = {}
            this.validate.invalid = {}
        },
        validateThirdStep(){
            if (this.stepThree.type < 0) {
                this.validation.invalid.type = 'Please select your voting system first.';
                return
            } else {
                this.validation.valid.type = 'The your voting system is OK.';
            }
            let flag = false
            this.stepThree.options.map((i)=>{
                if (i == '')
                    flag = true
            })
            if (flag){
                this.validation.invalid.options = 'Please fill out all the forms.';
                return
            }
            this.steps = 4
            this.validate.valid = {}
            this.validate.invalid = {}
        },

        validateFourthStep(){
            if (!this.stepFour.strategy) {
                this.validation.invalid.strategy = 'Please select your voting system first.';
                return
                } 
            this.steps = 5
            this.validate.valid = {}
            this.validate.invalid = {}
        },
        validateFifthStep(){
            let error = false
            if (this.stepFour.strategy ===  'whitelist'){
                // if (!this.stepFive.tck_symbol) {
                //     this.validation.invalid.tck_symbol = 'Please type your ticket symbol.';
                //     error = true
                // } else {
                //     this.validation.valid.tk_symbol = 'The ticket symbol is added.';
                // }
                if (!this.stepFive.whitelist) {
                    this.validation.invalid.whitelist = 'Please insert your whitelist.';
                    error = true
                } else {
                    this.validation.valid.whitelist = 'The whitelist is added.';
                }

            } else {
                
                if (!this.stepFive.tk_symbol) {
                    this.validation.invalid.tk_symbol = 'Please type your token symbol.';
                    error = true
                } else {
                    this.validation.valid.tk_symbol = 'The your token symbol is added.';
                }
                if (!this.stepFive.ctr_addr) {
                    this.validation.invalid.ctr_addr = 'Please type your contract address.';
                    error = true
                } else {
                    this.validation.valid.ctr_addr = 'The your contract address is added.';
                }
                
                if (this.stepFive.multiplier && this.stepFive.multiplier < 0){
                    console.log('uuujfiejfiefje')

                    this.validation.invalid.multiplier = 'The multiplier can not be less than 0.';
                    error = true
                }
                if (this.stepFive.threshold && this.stepFive.threshold < 0){
                    console.log('jfiejfiefje')
                    this.validation.invalid.threshold = 'The threshold can not be less than 0.';
                    error = true
                }
            }

            if (this.stepFive.quorum_status){
                if (!this.stepFive.percent) {
                    this.validation.invalid.percent = 'Please type your quorum percent.';
                    error = true
                } else {
                    if (this.stepFive.percent < 0){
                            this.validation.invalid.percent = 'The quorum percent can not be less than 0.';
                        error = true
                    }
                    if (this.stepFive.percent > 100){
                            this.validation.invalid.percent = 'The quorum percent can not be greater than 100.';
                        error = true
                    }
                }
                if (!this.stepFive.totalToken) {
                    this.validation.invalid.totalToken = 'Please type your quorum percent.';
                    error = true
                } else {
                    if (this.stepFive.totalToken < 0){
                            this.validation.invalid.totalToken = 'The quorum percent can not be less than 0.';
                        error = true
                    }
                    // if (this.stepFive.totalToken > 100){
                    //         this.validation.invalid.totalToken = 'The quorum percent can not be greater than 100.';
                    //     error = true
                    // }
                }

            }
            console.log(error)
            if (error)
                return
            this.steps = 6
            this.validate.valid = {}
            this.validate.invalid = {}

        },

        validateSixthStep(){
            let error = false
            if(!this.stepSix.timezone){
                this.validation.invalid.timezone = 'Please select your timezone.';
                error = true
            }else {
                    this.validation.valid.timezone = 'The timezone is added.';
            }
            if (error)
                return
            this.steps = 7
            this.validate.valid = {}
            this.validate.invalid = {}
        },
























		onXlsxSelected(file){
			console.log(file)
            this.clearValidation('whitelist')

			if (typeof file !== 'undefined') {
				this.filename = file.target.files[0].name
				var reader = new FileReader();
                this.stepFive.whitelist = []
                 readXlsxFile(file.target.files[0]).then((rows) => {
                     console.log('afefjefjoi')
                    console.log(rows)
                    rows.map((r, i)=>{
                        if (i > 0){
                            this.stepFive.whitelist.push(r[0])
                        }
                    })
                    // console.log(this.stepFive.whitelist.length)
                    // console.log(this.stepFive.whitelist[0])

    // `rows` is an array of rows
    // each row being an array of cells.
  })
				// reader.readAsText(file.target.files[0]);
				// reader.onloadend = async () => {
				// 	this.stepFive.whitelist = reader.result
				// };

			}

		},














        validate: function () {
            if (!this.firstName) {
                this.validation.invalid.firstName = 'Please type your First Name.';
            } else if (this.firstName.length < 2) {
                this.validation.invalid.firstName = 'First Name should have min. 2 characters.';
            } else if (this.firstName.match(/[^a-z]/i)) {
                this.validation.invalid.firstName = 'First Name should contains only latin letters (a-z).';
            } else {
                this.validation.valid.firstName = 'First Name is OK.';
            }
            if (!this.lastName) {
                this.validation.invalid.lastName = 'Please type your Last Name.';
            } else if (this.lastName.length < 2) {
                this.validation.invalid.lastName = 'Last Name should have min. 2 characters.';
            } else if (this.lastName.match(/[^a-z]/i)) {
                this.validation.invalid.lastName = 'Last Name should contains only latin letters (a-z).';
            } else {
                this.validation.valid.lastName = 'Last Name is fine.';
            }
            if (!this.userName) {
                this.validation.invalid.userName = 'Please type your Username.';
            } else if (this.userName.length < 5) {
                this.validation.invalid.userName = 'Username should have min. 5 characters.';
            } else if (this.userName.match(/[^a-z]/i)) {
                this.validation.invalid.userName = 'Username should contains only latin letters, numbers and _ (a-z, 0-9, _).';
            } else {
                this.validation.valid.userName = 'Username is OK.';
            }
        },
        clearValidation: function(field) {
            this.validation.valid[field] = '';
            this.validation.invalid[field] = '';
        }



        
    }
}
</script>
<style>
.dot {
  height: 5px;
  width: 5px;
  background-color: #959595;
  border-radius: 50%;
  display: inline-block;
  margin-right: 5px;
  margin-bottom: 3px;
}
.voting-sys{
    border: 1px solid #959595;
    /* margin-bottom: 20px; */
}
.selected {
    border: 1px solid #000000

}
/* .voting-sys:hover{
    border: 1px solid #000000
} */

</style>