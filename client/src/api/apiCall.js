import axios from 'axios'
function apiCall(url, method, data, successCallback, errorCallback){
    axios({
        method: method,
        url: url,
        data: data,
        headers: {},
        baseURL: "http://137.184.95.3"
    })
    .then(successCallback)
    .catch(errorCallback)
}
export default apiCall