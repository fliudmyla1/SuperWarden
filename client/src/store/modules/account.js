const getDefaultState = () => {
    return {
        _addr :'',
        name: '',
        _id : '',
        role: 10,
    }
  }
const state = getDefaultState()

const mutations = {
  RESET_STATE: (state) => {
    Object.assign(state, getDefaultState())
  },
  SET_ACCOUNT: (state, account) => {
    state._addr = account.address
    state.name = account.name
    state._id = account._id
  },
  SET_ROLE: (state, role) => {
    state.role = role
  },
}

const actions = {
  resetState({ commit }) {
    return new Promise(() => {
      commit('RESET_STATE')
    })
  },
  setAccount({ commit }, account) {
    commit('SET_ACCOUNT', account)
  },
  setRole({commit}, role){
    commit('SET_ROLE', role)
  },

}

export default {
  namespaced: true,
  state,
  mutations,
  actions,
}