import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Offers from '../views/Offers'
import Newad from '../views/Newad';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/offers',
    name: 'Offers',
    component: Offers
  },
  {
    path: '/newad',
    name: 'Newad',
    component: Newad
  },
 
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
