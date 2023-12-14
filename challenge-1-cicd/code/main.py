import os
from google.cloud import storage

def publish_file(data, context):
    storage_client = storage.Client()

    source_file_name = data['name']
    source_bucket_name = data['bucket']

    print(f"A file named:{source_file_name} is picked from source bucket:{source_bucket_name}")

    target_bucket_name = os.environ.get('target_bucket_var')
    target_file_name = 'processed_file.txt'

    source_bucket_ref = storage_client.bucket(source_bucket_name)
    source_blob = source_bucket_ref.blob(source_file_name)
    destination_bucket_ref = storage_client.bucket(target_bucket_name)
    destination_blob = destination_bucket_ref.blob(target_file_name)

    source_bucket_ref.copy_blob(source_blob, destination_bucket_ref, new_name=target_file_name)    
    
    print(f"A file named:{source_file_name} is placed to the target bucket:{target_bucket_name} with name: target_file_name")

