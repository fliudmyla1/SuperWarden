import axios from 'axios'
function apiCall(url, method, data, successCallback, errorCallback){
    axios({
        method: method,
        url: url,
        data: data,
        headers: {},
        baseURL: "http://127.0.0.1:5000"
    })
    .then(successCallback)
    .catch(errorCallback)
}
export default apiCall