# vim-config
Jednostavna konfiguracija za Vim Text Editor.

## Preuzimanje
Da bi se `.vimrc` fajl pravilno mogao učitati i source-ati, neophodno se prethodno prebaciti u **Home** folder komandom:
```
cd
```
Cijeli repozitorij se može preuzeti unošenjem sledeće linije u terminal:
```
git clone https://github.com/ArminDzanic/vim-config.git
```
Da bi se plugin-ovi uopšte pokrenuli, potrebno je u **Home** folderu izvršiti sledeće:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Ovo će instalirati `vim-plug` plugin na sistem, koji je u mogućnosti da učita i instalira ostale plugine.
Nakon što se instalira `vim'plug`, potrebno je ući u Vim komandom: 
```
vim
```
Prilikom ulaska Terminal će vjerovatno izbaciti neki error. To se zanemaruje jer se error odnosi na plugine koji još uvijek nisu instalirani na uređaj. 
Kada se uđe u Vim, potrebno je ukucati sledeće:
```
:PlugInstall
```
i sačekati sa izvršenjem. Ovo će da instalira svaki ugrađeni plugin.
Kada se dobije poruka `**Finishing ... Done!**`, potrebno je source-ati `.vimrc` fajl komandom:
```
:source ~/.vimrc
```
Čime se učitavaju izmjene.
