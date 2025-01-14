import axios from 'axios';
import { access_token } from '../constants/token';
import { refresh_token } from '../services/auth'; 

export const instance = axios.create({
  baseURL: 'http://localhost:8000/api/',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${access_token}`
  }
});

instance.interceptors.response.use(
  response => response,
  async error => {
    if (error.response.status === 401) {
      try {
        const response = await refresh_token(); 
        if (response && response.access_token) {
          const new_access_token = response.access_token;
          instance.defaults.headers.common['Authorization'] = `Bearer ${new_access_token}`; 
          error.config.headers['Authorization'] = `Bearer ${new_access_token}`; 
          return instance(error.config); 
        }
      } catch (refreshError) {
        console.log(refreshError);
        throw refreshError;
      }
    }
    return Promise.reject(error);
  }
);

export default instance;
