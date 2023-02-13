<template>
	<div class="container">
		<h2 class="mb-4 text-center">Új hirdetés elküldése</h2>
		<div class="row">
			<div class="offset-lg-3 offset-md-2 col-lg-6 col-md-8 col-12">
				<div class="mb-3">
					<label for="category" class="form-label"
						>Ingatlan kategóriája
					</label>
					<select
						class="form-select"
						v-model="ujIngatlanUrlap.kategoriaId"
					>
						<option value="0">Kérem válasszon</option>
						<option
							v-for="kategoria in kategoriak"
							:key="kategoria.id"
							:value="kategoria.id"
						>
							{{ kategoria.megnevezes }}
						</option>
						<!-- 
						<option value="1">Ház</option>
						<option value="2">Lakás</option>
						<option value="3">Építési telek</option>
						<option value="4">Garázs</option>
						<option value="5">Mezőgazdasági terület</option>
						<option value="6">Ipari ingatlan</option> 
						-->
					</select>
				</div>

				<div class="mb-3">
					<label for="date" class="form-label">Hirdetés dátuma</label>
					<input
						type="date"
						class="form-control"
						v-model="ujIngatlanUrlap.hirdetesDatuma"
					/>
				</div>
				<div class="mb-3">
					<label for="description" class="form-label">
						Ingatlan leírása
					</label>
					<textarea
						class="form-control"
						v-model="ujIngatlanUrlap.leiras"
						rows="3"
					></textarea>
				</div>
				<div class="form-check mb-3">
					<input
						class="form-check-input"
						type="checkbox"
						v-model="ujIngatlanUrlap.tehermentes"
					/>
					<label class="form-check-label" for="creditFree">
						Tehermentes ingatlan
					</label>
				</div>
				<div class="mb-3">
					<label for="pictureUrl" class="form-label">
						Fénykép az ingatlanról
					</label>
					<input
						type="url"
						class="form-control"
						v-model="ujIngatlanUrlap.kepUrl"
					/>
				</div>
				<div class="mb-3 text-center">
					<button class="btn btn-primary px-5" @click="mentes">
						Küldés
					</button>
				</div>

				<div
					class="alert alert-danger alert-dismissible"
					role="alert"
					v-if="hibaUzenet.length > 0"
				>
					<strong>{{ hibaUzenet }}</strong>
					<button type="button" class="btn-close"></button>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import DataService from "../services/dataservice";

export default {
	name: "newad",
	data() {
		return {
			ujIngatlanUrlap: {
				kategoriaId: 0,
				hirdetesDatuma: new Date().toISOString().split("T")[0],
				leiras: "",
				tehermentes: true,
				kepUrl: "",
			},
			kategoriak: [],
			hibaUzenet: "",
		};
	},
	methods: {
		mentes() {
			DataService.ujIngatlanMentes(this.ujIngatlanUrlap)
				.then(() => {
					this.$router.push("/");
				})
				.catch((err) => {
					this.hibaUzenet = err + " ";
					// let hiba = JSON.parse(JSON.stringify(err));
					// this.hibaUzenet = hiba.message
					// console.log(hiba);
				});
		},
	},
	created() {
		DataService.osszesKategoria().then((resp) => {
			this.kategoriak = resp;
		});
	},
};
</script>

<style scoped>
	.container {
		background-color: white;
	}
</style>