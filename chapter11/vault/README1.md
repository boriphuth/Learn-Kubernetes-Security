gcloud beta container --project "my-personal-302714" clusters create "my-first-cluster-1" --zone "asia-southeast2-a" --no-enable-basic-auth --cluster-version "1.19.6-gke.600" --release-channel "rapid" --machine-type "e2-small" --image-type "COS_CONTAINERD" --disk-type "pd-standard" --disk-size "32" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "3" --no-enable-stackdriver-kubernetes --enable-ip-alias --network "projects/my-personal-302714/global/networks/default" --subnetwork "projects/my-personal-302714/regions/asia-southeast2/subnetworks/default" --default-max-pods-per-node "110" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --enable-shielded-nodes --shielded-secure-boot

watch kubectl get all -n demo

kubectl patch deployment app --patch "$(cat patch-template-annotation.yaml)"

kubectl -n demo exec -it app-7f79fd4fd6-7slkp -c app -- cat /vault/secrets/postgres
