<script setup lang="ts">
  //   import { useStore1 } from "../store/store1";
  import { useStoreN } from "../store/storeN";
  //   import { date } from "quasar";
  //   import router from "src/router";

  const storeN = useStoreN();
  //   const store1 = useStore1();

  onMounted(() => {
    storeN.getAll();
  });

  const cols: any[] = [
    { name: "kategoriaNev", label: "Kategória", field: "kategoriaNev", align: "center" },
    { name: "leiras", label: "Leírás", field: "leiras", align: "center" },
    { name: "hirdetesDatum", label: "Hírdetés dátuma", field: "hirdetesDatuma", align: "center" },
    { name: "tehermentes", label: "Tehermentes", field: "tehermentes", align: "center" },
    { name: "kepUrl", label: "Fénykép", field: "kepUrl", align: "center" },
  ];
</script>

<template>
  <q-page>
    <q-table :columns="cols" :rows="storeN.dataN" wrap-cells>
      <template #body-cell-tehermentes="props">
        <q-td :props="props">
          <q-badge v-if="props.value" color="green" label="igen" />
          <q-badge v-else color="red" label="nem" />
        </q-td>
      </template>
      <template #body-cell-kepUrl="props">
        <q-td :props="props">
          <img alt="Fotó" :src="props.value" style="max-height: 100px" />
        </q-td>
      </template>
    </q-table>
  </q-page>
</template>

<style lang="scss" scoped></style>
