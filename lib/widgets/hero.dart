import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/widgets/helper_functions.dart';

main() {
  buildInDefaultContainer(
    Builder(
      builder: (context) => Stack(
        children: [
          Positioned(
            child: Hero(
              tag: 'MyHero',
              child: Image.network(
                  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpurepng.com%2Fpublic%2Fuploads%2Flarge%2Fpurepng.com-supermansupermanfictional-superherocomic-booksdc-comicscharacterjerry-siegelson-of-kryptonaction-comicsman-of-steel-1701528657792xzmg4.png&f=1&nofb=1'),
            ),
            left: 0,
            top: 0,
            width: 100,
            height: 100,
          ),
          Positioned.fill(
            child: Center(
              child: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('Pushed route'),
                      ),
                      body: Stack(
                        children: [
                          Positioned(
                            child: Center(
                              child: Hero(
                                tag: 'MyHero',
                                child: Image.network(
                                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpurepng.com%2Fpublic%2Fuploads%2Flarge%2Fpurepng.com-supermansupermanfictional-superherocomic-booksdc-comicscharacterjerry-siegelson-of-kryptonaction-comicsman-of-steel-1701528657792xzmg4.png&f=1&nofb=1'),
                              ),
                            ),
                            right: 0,
                            bottom: 0,
                            width: 100,
                            height: 100,
                          ),
                          Positioned.fill(
                            child: Center(
                              child: IconButton(
                                icon: Icon(Icons.remove_circle),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
