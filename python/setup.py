from setuptools import setup, find_packages
from os import path

here = path.abspath(path.dirname(__file__))

with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='myproject',
    version='0.0.1',
    description='My Description',
    long_description=long_description,
    url='http://github.com/lazyduo/myproject',

    author='Dada Ahn',
    author_email='dadanuna@gmail.com',

    license='MIT',

    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'Topic :: Software Development :: Libraries',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
    ],

    keywords='keywords1, keywords2',
    
    #   py_modules=["my_module"],
    #   packages=find_packages(where='src'),
    packages=find_packages(exclude=['contrib', 'docs', 'tests']),
  
    python_requires='>=3.6',
  
    install_requires=[
          'requests',
#         'Django',
#         'djangorestframework',
#         'django-cors-headers',
#         'psycopg2==2.8.6',
#         'PyYAML',
#         'google-api-python-client',
#         'google-auth-httplib2',
#         'google-auth-oauthlib',
#         'django-guardian',
#         'Pillow',
    ],

    extras_require={
        'dev': ['check-manifest'],
        'test': ['coverage', 'nose2'],
    },

    package_data={
        'sample': ['package_data.dat'],
    },
    include_package_data=True,

    entry_points={
        'console_scripts': [
            'sample=sample:main',
        ],
    },
)
