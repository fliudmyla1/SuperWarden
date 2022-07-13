const getDefaultState = () => {
    return {
        _addr :'',
        name: '',
        _id : ''
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
}

const actions = {
  resetState({ commit }) {
    return new Promise(() => {
      commit('RESET_STATE')
    })
  },
  setAccount({ commit }, account) {
    commit('SET_ACCOUNT', account)
  }

}

export default {
  namespaced: true,
  state,
  mutations,
  actions,
}