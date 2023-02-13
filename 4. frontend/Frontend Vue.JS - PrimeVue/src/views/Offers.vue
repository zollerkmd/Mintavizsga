<template>
	<div class="container">
		<h1 class="text-center">Ajánlataink</h1>
		<DataTable
			:value="ingalanok"
			columnResizeMode="fit"
			responsiveLayout="scroll"
			class="shadow"
		>
			<Column field="kategoriaNev" header="Kategória"></Column>
			<Column field="leiras" header="Leírás"></Column>
			<Column field="hirdetesDatuma" header="Hirdetes Dátuma"></Column>
			<Column header="Tehermentes">
				<template #body="slotProps">
					<span :class="slotProps.data.tehermentes ? 'zold' : 'piros'">
						{{ slotProps.data.tehermentes ? "Igen" : "Nem" }}
					</span>
				</template>
			</Column>
			<Column header="Fénykép" >
				<template #body="slotProps">
					<img :src="slotProps.data.kepUrl" class="kep" />
				</template>
			</Column>
		</DataTable>
	</div>
</template>

<script>
import DataService from "../services/dataservice";
import DataTable from "primevue/datatable";
import Column from "primevue/column";

export default {
	name: "offers",
	components: {
		DataTable,
		Column,
	},
	data() {
		return {
			ingalanok: [],
		};
	},
	created() {
		DataService.osszesIngatlan().then((resp) => {
			this.ingalanok = resp;
		});
	},
};
</script>

<style scoped>
	.container {
			background-color: white
	}
	.zold{
		color: green;
	}
	.piros {
		color: red;
	}
	.kep {
		height: 100px;
		margin-left: auto;
		margin-right: auto;
		display: block;
	}
</style>