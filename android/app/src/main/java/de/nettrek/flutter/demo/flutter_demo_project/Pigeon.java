// Autogenerated from Pigeon (v1.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package de.nettrek.flutter.demo.flutter_demo_project;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class Pigeon {
  private static class BatteryApiCodec extends StandardMessageCodec {
    public static final BatteryApiCodec INSTANCE = new BatteryApiCodec();
    private BatteryApiCodec() {}
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface BatteryApi {
    Long getBatteryLevel();

    /** The codec used by BatteryApi. */
    static MessageCodec<Object> getCodec() {
      return BatteryApiCodec.INSTANCE;
    }

    /** Sets up an instance of `BatteryApi` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, BatteryApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.BatteryApi.getBatteryLevel", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Long output = api.getBatteryLevel();
              wrapped.put("result", output);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", null);
    return errorMap;
  }
}
