import 'package:flutter/material.dart';
import 'package:noboto_app/src/business_logic/models/models.dart';
import 'package:noboto_app/src/views/ui/home_posts/components/post_card.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> posts = [
    Post(
        id: "0",
        active: true,
        want: "Libro",
        wantDescription:
            "Me gusta leer y pintar.\nMe sirve cualquier cosa para mis hobbies.",
        product: Product(
            id: "1",
            name: "Violín",
            description:
                "Busco cambiar este violín, nunca aprendí a tocarlo.\nEstá en perfecto estado.",
            imageUrls: [
              "https://www.infobae.com/new-resizer/VOtEN56tRzz61mtQez3LJvsHy8U=/1200x628/filters:format(jpg):quality(85)//s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2016/12/24071604/violin-stradivarius-1920-3.jpg"
            ]),
        user: User(
            name: "Sara Gonzalez",
            profilePictureUrl:
                "https://cdn2.salud180.com/sites/default/files/styles/medium/public/field/image/2020/03/estas_son_las_caracteristicas_que_vuelven_a_una_mujer_irresistible_segun_ellos.jpg",
            rating: 3.5)),
    Post(
        id: "1",
        active: true,
        want: "Libro",
        wantDescription:
            "Negociable, pero me gustaría un libro, ojalá de ficción",
        product: Product(
            id: "1",
            name: "Libro de La Peste",
            description:
                "Busco cambiar este libro por otro libro. Está como nuevo, realmente me lo regalaron y ya tenía una copia \n Edición: Debolsillo",
            imageUrls: [
              "https://1.bp.blogspot.com/-NwxXKFhXQX4/WK922_LuoaI/AAAAAAAAC8Q/LbCfS2HqStA7TMVgjKDekmobS9IBv_rHQCLcB/s1600/DSC00346.jpg"
            ]),
        user: User(
            name: "Juan Gonzalez",
            profilePictureUrl:
                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            rating: 4.1)),
    Post(
        id: "1",
        active: true,
        want: "Moldes de Repostería",
        wantDescription: "Me gustaría que fueran de diversas formas",
        product: Product(
            id: "1",
            name: "Licuadora",
            description: "Libro",
            imageUrls: [
              "https://www.casasnuevasaqui.com/guia/wp-content/uploads/2020/05/licuadora.jpg"
            ]),
        user: User(
            name: "María Vargas",
            profilePictureUrl:
                "https://i.pinimg.com/474x/30/5b/e5/305be5ff3b0b81253090c017dadc0d7a.jpg",
            rating: 3.5))
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(posts[index]);
        },
      ),
    );
  }
}
