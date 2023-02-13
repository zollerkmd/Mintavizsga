<script setup lang="ts">
  import { useStore1 } from "../store/store1";
  import { useStoreN } from "../store/storeN";
  import { date } from "quasar";
  //   import router from "src/router";

  const storeN = useStoreN();
  const store1 = useStore1();

  onMounted(() => {
    store1.getAll();
    storeN.data = {
      hirdetesDatuma: date.formatDate(new Date(), "YYYY-MM-DD"),
      tehermentes: true,
    };
  });

  function onSubmit() {
    storeN.create();
  }
</script>

<template>
  <q-page>
    <div class="row justify-center q-pa-md">
      <div class="col-12 col-sm-8 col-md-6 col-lg-4">
        <q-form class="q-gutter-md text-center" @submit="onSubmit">
          <h5>Új hirdetés elküldése</h5>
          <q-select
            v-model="storeN.data.kategoriaId"
            clearable
            dense
            emit-value
            label="Ingatlan kategóriája"
            map-options
            option-label="megnevezes"
            option-value="id"
            :options="store1.data1"
            outlined
            :rules="[(v) => v != null || 'Kérem válasszon!']"
          />
          <q-input
            v-model="storeN.data.hirdetesDatuma"
            clearable
            disable
            label="Hírdetés dátuma"
            outlined
            type="date"
          />
          <q-input
            v-model="storeN.data.leiras"
            dense
            label="Leírás"
            outlined
            :rules="[(v) => (v != null && v != '') || 'Kérem töltse ki a mezőt!']"
            type="textarea"
          />
          <div class="text-left">
            <q-checkbox v-model="storeN.data.tehermentes" label="Tehermentes ingatlan" />
          </div>

          <q-input
            v-model="storeN.data.kepUrl"
            dense
            label="Fénykép az ingatlanról"
            outlined
            :rules="[(v) => (v != null && v != '') || 'Kérem töltse ki a mezőt!']"
            type="url"
          />
          <q-btn class="q-px-md" color="green" label="Küldés" no-caps type="submit" />
        </q-form>
      </div>
    </div>
  </q-page>
</template>

<style lang="scss" scoped></style>
