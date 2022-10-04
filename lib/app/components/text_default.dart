import 'package:flutter/cupertino.dart';

class TextBold extends StatelessWidget {
  const TextBold(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow,
    this.textColour,
  })  : assert(
          text != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(key: key);
  final String? text;
  final double? fontSize;
  final Color? textColour;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: textColour ?? CupertinoColors.black,
      ),
    );
  }
}

class TextThin extends StatelessWidget {
  const TextThin(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow,
    this.textColour,
  })  : assert(
          text != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(key: key);
  final String? text;
  final double? fontSize;
  final Color? textColour;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
        color: textColour ?? CupertinoColors.black,
      ),
    );
  }
}

class TextRegular extends StatelessWidget {
  const TextRegular(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow,
    this.textColour,
  })  : assert(
          text != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(key: key);
  final String? text;
  final double? fontSize;
  final Color? textColour;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: textColour ?? CupertinoColors.black,
      ),
    );
  }
}

class TextLight extends StatelessWidget {
  const TextLight(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow,
    this.textColour,
  })  : assert(
          text != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(key: key);
  final String? text;
  final double? fontSize;
  final Color? textColour;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: fontSize,
        color: textColour ?? CupertinoColors.black,
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  const TextMedium(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow,
    this.textColour,
  })  : assert(
          text != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(key: key);
  final String? text;
  final double? fontSize;
  final Color? textColour;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: textColour ?? CupertinoColors.black,
      ),
    );
  }
}

class TextSemiBold extends StatelessWidget {
  const TextSemiBold(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow,
    this.textColour,
  })  : assert(
          text != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(key: key);
  final String? text;
  final double? fontSize;
  final Color? textColour;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: textColour ?? CupertinoColors.black,
      ),
    );
  }
}

class TextBlack extends StatelessWidget {
  const TextBlack(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow,
    this.textColour,
  })  : assert(
          text != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(key: key);
  final String? text;
  final double? fontSize;
  final Color? textColour;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        color: textColour ?? CupertinoColors.black,
      ),
    );
  }
}

class TextExtraBold extends StatelessWidget {
  const TextExtraBold(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow,
    this.textColour,
  })  : assert(
          text != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(key: key);
  final String? text;
  final double? fontSize;
  final Color? textColour;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
        color: textColour ?? CupertinoColors.black,
      ),
    );
  }
}

class TextExtraThin extends StatelessWidget {
  const TextExtraThin(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow,
    this.textColour,
  })  : assert(
          text != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(key: key);
  final String? text;
  final double? fontSize;
  final Color? textColour;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w100,
        fontSize: fontSize,
        color: textColour ?? CupertinoColors.black,
      ),
    );
  }
}
