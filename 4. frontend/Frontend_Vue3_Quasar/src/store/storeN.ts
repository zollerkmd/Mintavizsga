import $axios from "./axios.instance";
import { defineStore } from "pinia";
import { Notify, Loading } from "quasar";
import router from "src/router";

Notify.setDefaults({
  position: "bottom",
  textColor: "white",
  timeout: 3000,
  actions: [{ icon: "close", color: "white" }],
});

interface IFields {
  id?: number; // PK
  kategoriaId?: number; // FK
  kategoriaNev?: string;
  leiras?: string;
  hirdetesDatuma?: string;
  tehermentes?: boolean;
  kepUrl?: string;
}

interface IState {
  dataN: Array<IFields>; // store documents (records) after get method(s)
  data: IFields; // temporary object for new, edit and delete method
  dataOld: IFields; // temporary object, before edit store data here
}

export const useStoreN = defineStore({
  id: "storeN",
  state: (): IState => ({
    dataN: [],
    data: {},
    dataOld: {},
  }),
  getters: {},
  actions: {
    async getAll(): Promise<void> {
      Loading.show();
      this.dataN = [];
      $axios
        .get("api/ingatlan")
        .then((res) => {
          Loading.hide();
          if (res && res.data) {
            this.dataN = res.data;
          }
        })
        .catch((error) => {
          Loading.hide();
          Notify.create({ message: `Error on N-side: ${error.message}`, color: "negative" });
        });
    },
    async create(): Promise<void> {
      if (this.data) {
        Loading.show();
        $axios
          .post("api/ujingatlan", this.data)
          .then((res) => {
            Loading.hide();
            if (res && res.data) {
              // this.data = {};
              this.getAll();
              Notify.create({
                message: `New document with id=${res.data.id} has been saved successfully!`,
                color: "positive",
              });
              router.push({ name: "offers" });
            }
          })
          .catch((error) => {
            Loading.hide();
            Notify.create({ message: `Error on N-side: ${error.message}`, color: "negative" });
          });
      }
    },
  },
});
