import os
import random
from django.conf import settings

def random_background_image(request):
    background_images_path = os.path.join(settings.STATICFILES_DIRS[0], 'img', 'bg_pngs')
    background_images = os.listdir(background_images_path)
    selected_image = random.choice(background_images)
    return {
        'background_image_url': os.path.join('img', 'bg_pngs', selected_image)
    }