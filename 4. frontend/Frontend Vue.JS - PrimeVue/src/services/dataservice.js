import Axios from 'axios'

//Axios.defaults.baseURL = 'http://localhost:5000'   // a proxy miatt nem kell!

export default {
  osszesIngatlan() {
    return Axios.get('/api/ingatlan')
      .then(resp => {
        return resp.data;
      })
      .catch(err => {
        return Promise.reject(err);
      })
  },
  osszesKategoria() {
    return Axios.get('/api/kategoriak')
      .then(resp => {
        return resp.data;
      })
      .catch(err => {
        return Promise.reject(err);
      })
  },
  ujIngatlanMentes(ujIngatlan) {
    return Axios.post('/api/ujingatlan', ujIngatlan)
      .then(resp => {
        return resp.data;
      })
      .catch(err => {
        return Promise.reject(err);
      })
  }
}