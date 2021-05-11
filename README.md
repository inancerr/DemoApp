# DemoApp

- Third party kütüphane kullanılmadı.
- MVVM kullanıldı.
- Network, ProductAPI, Entities, Utility, LocalStorage olmak üzere Bussiness logicler olabildiğince ayırştırılarak Swift Package'lar halinde tutuldu. Proje genişliğine göre daha da ayrıştırılabilir.
- LocalStorge api katmanında Network Connection Error alınması durumunda devreye girmektedir. Aksi taktirde servis üzerinden veriler alınır.(Bkz. ProductApi/Live)
- Unit Test sadece View Model'lara yazıldı. Fakat URLSession mocklanarak aynı mantık ile diğer katmanlara da (Network, LocalStorage, ProductAPI vs..) Unit Test yazılabilir.
- Image'lar reusable olması için sadece runtime da cache'lendi. Offline kullanım için FileManager ile Disc üzerinde de tutalabilir fakat hafıza yönetimi için detaylıca vakit ayırıp üzerinde çalışmak gerekir. Genelde KingFisher tarzı kütüphaneler tercih ediliyor.
