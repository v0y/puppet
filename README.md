# puppet

### requirements

```bash
puppet module install stankevich-python
```

### apply

```bash
cd /etc/puppet && sudo git pull --force && sudo puppet apply /etc/puppet/manifests/site.pp --debug
```
